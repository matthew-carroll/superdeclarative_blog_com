/// External social and website links used across the blog (header, footer, etc.).
abstract final class SiteLinks {
  static const String mainSite = 'https://superdeclarative.com';
  static const String xAccount = 'https://x.com/suprdeclarative';
  static const String xHandle = '@SuprDeclarative';

  static const String linkedIn = 'https://www.linkedin.com/in/matt-carroll-product-engineer/';
}

/// Estimates reading time in minutes from compiled HTML content.
int estimateReadingMinutes(String htmlContent) {
  final plainText = htmlContent.replaceAll(RegExp(r'<[^>]*>'), ' ');
  final words = plainText.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
  final minutes = (words / 220).ceil();
  return minutes < 1 ? 1 : minutes;
}
