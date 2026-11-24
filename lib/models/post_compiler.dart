import 'dart:io';
import 'package:markdown/markdown.dart' as md;
import 'post.dart';

void compilePosts() {
  final contentDir = Directory('content');
  if (!contentDir.existsSync()) {
    return;
  }

  final files = contentDir.listSync().whereType<File>().where((f) => f.path.endsWith('.md')).toList();
  final parsedPosts = <_CompiledPost>[];

  for (final file in files) {
    final id = file.uri.pathSegments.last.replaceAll('.md', '');
    final content = file.readAsStringSync();
    
    // Parse Frontmatter
    final lines = content.split('\n');
    String title = '';
    String date = '';
    String excerpt = '';
    bool draft = false;
    final bodyLines = <String>[];
    
    bool inFrontmatter = false;
    int delimiterCount = 0;
    
    for (final line in lines) {
      if (line.trim() == '---') {
        inFrontmatter = delimiterCount == 0;
        delimiterCount++;
        continue;
      }
      
      if (inFrontmatter) {
        if (line.startsWith('title:')) {
          title = line.substring(6).trim();
        } else if (line.startsWith('date:')) {
          date = line.substring(5).trim();
        } else if (line.startsWith('excerpt:')) {
          excerpt = line.substring(8).trim();
        } else if (line.startsWith('draft:')) {
          draft = line.substring(6).trim().toLowerCase() == 'true';
        }
      } else {
        bodyLines.add(line);
      }
    }
    
    final markdownBody = bodyLines.join('\n');
    final htmlBody = md.markdownToHtml(markdownBody);

    // Inject IDs into H2 and H3 headings and extract them in order
    final headingRegex = RegExp(r'<(h2|h3)>(.*?)</\1>');
    final headings = <_ParsedHeading>[];
    
    final htmlBodyWithIds = htmlBody.replaceAllMapped(headingRegex, (match) {
      final tag = match.group(1)!; // 'h2' or 'h3'
      final text = match.group(2)!;
      final level = tag == 'h2' ? 2 : 3;
      
      final slug = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9 ]'), '').replaceAll(' ', '-');
      
      headings.add(_ParsedHeading(text, level));
      
      return '<$tag id="$slug">$text</$tag>';
    });

    parsedPosts.add(_CompiledPost(
      id: id,
      title: title,
      date: date,
      publishedDate: parsePublicationDate(date),
      excerpt: excerpt,
      draft: draft,
      htmlBodyWithIds: htmlBodyWithIds,
      headings: headings,
    ));
  }

  parsedPosts.sort((a, b) {
    final dateA = a.publishedDate;
    final dateB = b.publishedDate;
    if (dateA != null && dateB != null) {
      final cmp = dateB.compareTo(dateA);
      if (cmp != 0) return cmp;
    } else if (dateA != null) {
      return -1;
    } else if (dateB != null) {
      return 1;
    }
    return a.id.compareTo(b.id);
  });

  final buffer = StringBuffer();

  buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
  buffer.writeln('import \'post.dart\';');
  buffer.writeln();
  buffer.writeln('const List<BlogPost> mockPosts = [');

  for (final post in parsedPosts) {
    // Escape single quotes for Dart string literal
    final escapedTitle = post.title.replaceAll("'", "\\'");
    final escapedDate = post.date.replaceAll("'", "\\'");
    final escapedExcerpt = post.excerpt.replaceAll("'", "\\'");
    final escapedHtmlBody = post.htmlBodyWithIds.replaceAll("'", "\\'").replaceAll(r'$', '\\\$');

    buffer.writeln('  BlogPost(');
    buffer.writeln('    id: \'${post.id}\',');
    buffer.writeln('    title: \'$escapedTitle\',');
    buffer.writeln('    date: \'$escapedDate\',');
    buffer.writeln('    excerpt: \'$escapedExcerpt\',');
    if (post.draft) {
      buffer.writeln('    draft: true,');
    }
    buffer.writeln('    content: \'\'\'$escapedHtmlBody\'\'\',');
    buffer.writeln('    headings: const [');
    for (final h in post.headings) {
      final escapedH = h.text.replaceAll("'", "\\'");
      buffer.writeln('      BlogPostHeading(text: \'$escapedH\', level: ${h.level}),');
    }
    buffer.writeln('    ],');
    buffer.writeln('  ),');
  }

  buffer.writeln('];');

  final outputFile = File('lib/models/posts_generated.dart');
  final newContent = buffer.toString();

  // Compare content before writing to avoid triggering endless build daemon loops!
  if (outputFile.existsSync()) {
    final existingContent = outputFile.readAsStringSync();
    if (existingContent == newContent) {
      return; // Skip writing since content is identical
    }
  }

  outputFile.writeAsStringSync(newContent);
}

class _CompiledPost {
  final String id;
  final String title;
  final String date;
  final DateTime? publishedDate;
  final String excerpt;
  final bool draft;
  final String htmlBodyWithIds;
  final List<_ParsedHeading> headings;

  _CompiledPost({
    required this.id,
    required this.title,
    required this.date,
    required this.publishedDate,
    required this.excerpt,
    required this.draft,
    required this.htmlBodyWithIds,
    required this.headings,
  });
}

class _ParsedHeading {
  final String text;
  final int level;

  _ParsedHeading(this.text, this.level);
}
