export 'posts_generated.dart';

class BlogPostHeading {
  final String text;
  final int level;

  const BlogPostHeading({required this.text, required this.level});
}

class BlogPost {
  final String id;
  final String title;
  final String date;
  final String excerpt;
  final String content;
  final List<BlogPostHeading> headings;
  final bool draft;

  const BlogPost({
    required this.id,
    required this.title,
    required this.date,
    required this.excerpt,
    required this.content,
    required this.headings,
    this.draft = false,
  });

  DateTime? get publishedDate => parsePublicationDate(date);
}

DateTime? parsePublicationDate(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;

  final iso = DateTime.tryParse(trimmed);
  if (iso != null) return iso;

  const months = <String, int>{
    'january': 1,
    'jan': 1,
    'february': 2,
    'feb': 2,
    'march': 3,
    'mar': 3,
    'april': 4,
    'apr': 4,
    'may': 5,
    'june': 6,
    'jun': 6,
    'july': 7,
    'jul': 7,
    'august': 8,
    'aug': 8,
    'september': 9,
    'sep': 9,
    'sept': 9,
    'october': 10,
    'oct': 10,
    'november': 11,
    'nov': 11,
    'december': 12,
    'dec': 12,
  };

  final match = RegExp(r'^([A-Za-z]+)\s+(\d{1,2}),?\s+(\d{4})$').firstMatch(trimmed);
  if (match != null) {
    final month = months[match.group(1)!.toLowerCase()];
    final day = int.tryParse(match.group(2)!);
    final year = int.tryParse(match.group(3)!);
    if (month != null && day != null && year != null) {
      return DateTime(year, month, day);
    }
  }

  return null;
}

int comparePostsByDateDesc(BlogPost a, BlogPost b) {
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
}
