import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/links.dart';
import '../constants/theme.dart';
import '../models/post.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    final blogPosts = mockPosts.where((post) => post.id != 'about' && !post.draft).toList()
      ..sort(comparePostsByDateDesc);
    final featuredPost = blogPosts.isNotEmpty ? blogPosts.first : null;
    final recentPosts = blogPosts.isNotEmpty ? blogPosts.skip(1).toList() : <BlogPost>[];

    return section(classes: 'home-section', [
      // Full-bleed Modern Publishing × Dark AI Hero Section
      header(classes: 'home-hero', [
        div(classes: 'hero-aurora', []),
        div(classes: 'home-hero-inner', [
          div(classes: 'home-hero-avatar-wrap', [
            img(
              src: '/images/hero-avatar.png',
              alt: 'Matt Carroll',
              classes: 'home-hero-avatar home-hero-avatar-dark',
            ),
            img(
              src: '/images/hero-avatar-light.png?v=2',
              alt: 'Matt Carroll',
              classes: 'home-hero-avatar home-hero-avatar-light',
            ),
          ]),
          div(classes: 'home-hero-text', [
            span(classes: 'home-hero-category', [.text('Matt Carroll')]),
            h1(classes: 'hero-title', [
              .text('Product Designs'),
            ]),
            p(classes: 'hero-subtitle', [
              .text(
                'How I approach UX/UI design for apps, websites, and games.',
              ),
            ]),
          ]),
        ]),
      ]),

      // Clean Medium-Style Single-Column Editorial Feed
      div(classes: 'home-feed', [
        if (featuredPost != null) ...[
          div(classes: 'feed-section-label', [.text('Latest')]),
          a(href: '/post/${featuredPost.id}', classes: 'story-featured-link', [
            article(classes: 'story-featured', [
              if (featuredPost.date.isNotEmpty)
                div(classes: 'story-author-row', [
                  span(classes: 'story-meta', [.text(featuredPost.date)]),
                ]),
              h2(classes: 'story-featured-title', [
                .text(featuredPost.title),
              ]),
              p(classes: 'story-featured-excerpt', [.text(featuredPost.excerpt)]),
              div(classes: 'story-footer-row', [
                span(classes: 'story-meta', [.text('${estimateReadingMinutes(featuredPost.content)} min read')]),
                span(classes: 'story-read-link', [.text('Read →')]),
              ]),
            ]),
          ]),
        ],

        if (recentPosts.isNotEmpty) ...[
          div(classes: 'feed-section-label more-label', [.text('More product designs')]),
          div(classes: 'story-list', [
            for (final post in recentPosts)
              a(href: '/post/${post.id}', classes: 'story-row-link', [
                article(classes: 'story-row', [
                  if (post.date.isNotEmpty)
                    div(classes: 'story-author-row', [
                      span(classes: 'story-meta', [.text(post.date)]),
                    ]),
                  h3(classes: 'story-row-title', [
                    .text(post.title),
                  ]),
                  p(classes: 'story-row-excerpt', [.text(post.excerpt)]),
                  div(classes: 'story-footer-row', [
                    span(classes: 'story-meta', [.text('${estimateReadingMinutes(post.content)} min read')]),
                    span(classes: 'story-read-link', [.text('Read →')]),
                  ]),
                ]),
              ]),
          ]),
        ],
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.home-section').styles(
      width: 100.percent,
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      backgroundColor: bgCanvas,
    ),

    // ---------------- HOME HERO ----------------
    css('.home-hero').styles(
      width: 100.percent,
      minHeight: 720.px,
      position: .relative(),
      display: .flex,
      justifyContent: .center,
      alignItems: .center,
      overflow: .hidden,
      border: Border.only(
        bottom: BorderSide(style: BorderStyle.solid, width: 1.px, color: borderSubtle),
      ),
      raw: {
        'background': 'var(--hero-bg)',
      },
    ),
    css('.hero-aurora').styles(
      position: .absolute(top: (-120).px, left: 50.percent),
      width: 860.px,
      height: 380.px,
      raw: {
        'transform': 'translateX(-50%)',
        'pointer-events': 'none',
        'background': 'var(--hero-aurora)',
        'filter': 'blur(34px)',
      },
    ),
    css('.home-hero-inner').styles(
      position: .relative(),
      zIndex: ZIndex(2),
      maxWidth: 1080.px,
      width: 100.percent,
      padding: Padding.fromLTRB(24.px, 96.px, 24.px, 56.px),
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      justifyContent: .center,
      raw: {
        'gap': '28px',
      },
    ),
    css('.home-hero-avatar-wrap').styles(
      display: .flex,
      alignItems: .center,
      justifyContent: .center,
      raw: {
        'flex-shrink': '0',
      },
    ),
    css('.home-hero-avatar').styles(
      width: 280.px,
      height: 280.px,
      radius: .all(.circular(999.px)),
      raw: {
        'object-fit': 'cover',
        'mask-image': 'radial-gradient(circle closest-side at 50% 50%, black 80%, transparent 100%)',
        '-webkit-mask-image': 'radial-gradient(circle closest-side at 50% 50%, black 80%, transparent 100%)',
        'animation':
            'heroFadeSlideUp 950ms cubic-bezier(0.22, 1, 0.36, 1) 0ms both, '
            'heroAvatarFloat 4.8s ease-in-out 950ms infinite',
      },
    ),
    css('.home-hero-avatar-light').styles(
      display: .none,
    ),
    css('html[data-theme="light"] .home-hero-avatar-dark').styles(
      display: .none,
    ),
    css('html[data-theme="light"] .home-hero-avatar-light').styles(
      display: .block,
      raw: {
        'mask-image':
            'radial-gradient(circle closest-side at 50% 50%, '
            'black 62%, '
            'rgba(0, 0, 0, 0.90) 72%, '
            'rgba(0, 0, 0, 0.65) 81%, '
            'rgba(0, 0, 0, 0.30) 89%, '
            'rgba(0, 0, 0, 0.08) 95%, '
            'transparent 99%)',
        '-webkit-mask-image':
            'radial-gradient(circle closest-side at 50% 50%, '
            'black 62%, '
            'rgba(0, 0, 0, 0.90) 72%, '
            'rgba(0, 0, 0, 0.65) 81%, '
            'rgba(0, 0, 0, 0.30) 89%, '
            'rgba(0, 0, 0, 0.08) 95%, '
            'transparent 99%)',
      },
    ),
    css('.home-hero-text').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .start,
      textAlign: .left,
      maxWidth: 320.px,
      width: 100.percent,
      margin: Margin.symmetric(horizontal: .auto),
    ),
    css('.home-hero-category').styles(
      fontFamily: fontSans,
      fontSize: 15.px,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4.px,
      color: inkSecondary,
      margin: Margin.only(bottom: 10.px),
      raw: {
        'animation': 'heroFadeSlideUp 900ms cubic-bezier(0.22, 1, 0.36, 1) 220ms both',
      },
    ),
    css('.hero-title').styles(
      fontFamily: fontSans,
      fontSize: 38.px,
      fontWeight: FontWeight.w800,
      lineHeight: 1.12.em,
      letterSpacing: (-1.2).px,
      color: inkPrimary,
      margin: Margin.only(bottom: 20.px),
      raw: {
        'text-wrap': 'balance',
        'animation': 'heroFadeSlideUp 900ms cubic-bezier(0.22, 1, 0.36, 1) 220ms both',
      },
    ),
    css('.hero-subtitle').styles(
      fontFamily: fontSans,
      fontSize: 18.px,
      lineHeight: 1.52.em,
      color: inkSecondary,
      fontWeight: FontWeight.w400,
      maxWidth: 560.px,
      raw: {
        'text-wrap': 'balance',
        'animation': 'heroFadeSlideUp 850ms cubic-bezier(0.22, 1, 0.36, 1) 360ms both',
      },
    ),

    // ---------------- MEDIUM-STYLE FEED ----------------
    css('.home-feed').styles(
      maxWidth: 720.px,
      width: 100.percent,
      padding: Padding.fromLTRB(24.px, 52.px, 24.px, 96.px),
      display: .flex,
      flexDirection: .column,
      raw: {
        'animation': 'heroFadeIn 900ms cubic-bezier(0.22, 1, 0.36, 1) 520ms both',
      },
    ),
    css('.feed-section-label').styles(
      fontFamily: fontSans,
      fontSize: 13.px,
      fontWeight: FontWeight.w600,
      color: inkMuted,
      margin: Margin.only(bottom: 20.px),
      letterSpacing: 0.2.px,
    ),
    css('.more-label').styles(
      margin: Margin.only(top: 52.px, bottom: 8.px),
    ),

    // Featured Story (calm dark AI sheen, editorial hierarchy)
    css('.story-featured-link, .story-row-link').styles(
      display: .block,
      textDecoration: .none,
      color: .inherit,
    ),
    css('.story-featured').styles(
      position: .relative(),
      padding: Padding.all(32.px),
      radius: .all(.circular(16.px)),
      backgroundColor: bgElevated,
      border: Border.all(color: borderSubtle, width: 1.px, style: BorderStyle.solid),
      display: .flex,
      flexDirection: .column,
      raw: {
        'background': 'var(--featured-bg)',
        'box-shadow': 'var(--featured-shadow)',
        'transition': 'border-color 200ms ease, background 220ms ease',
      },
    ),
    css('.story-featured-link:hover .story-featured').styles(
      border: Border.all(color: const Color('#FFED4B59'), width: 1.px, style: BorderStyle.solid),
    ),
    css('html[data-theme="light"] .story-featured-link:hover .story-featured').styles(
      border: Border.all(color: borderAccent, width: 1.px, style: BorderStyle.solid),
    ),
    css('.story-author-row').styles(
      display: .flex,
      alignItems: .center,
      margin: Margin.only(bottom: 14.px),
      raw: {
        'gap': '8px',
      },
    ),
    css('.story-avatar').styles(
      width: 24.px,
      height: 24.px,
      radius: .all(.circular(999.px)),
      display: .inlineFlex,
      alignItems: .center,
      justifyContent: .center,
      fontSize: 10.px,
      fontWeight: FontWeight.w600,
      color: inkPrimary,
      raw: {
        'background': 'linear-gradient(135deg, #6366F1 0%, #38BDF8 100%)',
      },
    ),
    css('.story-author').styles(
      fontSize: 14.px,
      fontWeight: FontWeight.w500,
      color: inkProse,
    ),
    css('.story-dot').styles(
      fontSize: 14.px,
      color: inkMuted,
    ),
    css('.story-meta').styles(
      fontSize: 14.px,
      color: inkMuted,
    ),
    css('.story-featured-title').styles(
      fontFamily: fontSans,
      fontSize: 28.px,
      fontWeight: FontWeight.w700,
      lineHeight: 1.2.em,
      letterSpacing: (-0.7).px,
      margin: Margin.only(bottom: 12.px),
      color: inkPrimary,
      raw: {
        'transition': 'color 160ms ease',
      },
    ),
    css('.story-featured-link:hover .story-featured-title').styles(
      color: brandYellow,
    ),
    css('html[data-theme="light"] .story-featured-link:hover .story-featured-title').styles(
      color: accentIndigoBright,
    ),
    css('.story-featured-excerpt').styles(
      fontFamily: fontSerif,
      fontSize: 18.5.px,
      lineHeight: 1.6.em,
      color: inkSecondary,
      margin: Margin.only(bottom: 24.px),
    ),
    css('.story-footer-row').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: .center,
    ),
    css('.story-read-link').styles(
      fontSize: 14.px,
      fontWeight: FontWeight.w500,
      color: accentIndigoBright,
      textDecoration: .none,
      raw: {
        'transition': 'color 160ms ease',
      },
    ),
    css('.story-featured-link:hover .story-read-link, .story-row-link:hover .story-read-link').styles(
      color: brandYellow,
    ),
    css(
      'html[data-theme="light"] .story-featured-link:hover .story-read-link, '
      'html[data-theme="light"] .story-row-link:hover .story-read-link',
    ).styles(
      color: accentCyan,
    ),

    // Medium-style hairline-separated story rows
    css('.story-list').styles(
      display: .flex,
      flexDirection: .column,
    ),
    css('.story-row').styles(
      padding: Padding.symmetric(vertical: 28.px),
      border: Border.only(
        bottom: BorderSide(style: BorderStyle.solid, width: 1.px, color: borderSubtle),
      ),
      display: .flex,
      flexDirection: .column,
    ),
    css('.story-row-title').styles(
      fontFamily: fontSans,
      fontSize: 22.px,
      fontWeight: FontWeight.w700,
      lineHeight: 1.25.em,
      letterSpacing: (-0.4).px,
      margin: Margin.only(bottom: 8.px),
      color: inkPrimary,
      raw: {
        'transition': 'color 160ms ease',
      },
    ),
    css('.story-row-link:hover .story-row-title').styles(
      color: brandYellow,
    ),
    css('html[data-theme="light"] .story-row-link:hover .story-row-title').styles(
      color: accentIndigoBright,
    ),
    css('.story-row-excerpt').styles(
      fontFamily: fontSerif,
      fontSize: 17.px,
      lineHeight: 1.58.em,
      color: inkSecondary,
      margin: Margin.only(bottom: 16.px),
    ),

    // Responsive
    css.media(MediaQuery.screen(minWidth: 640.px), [
      css('.story-featured').styles(
        padding: Padding.all(36.px),
      ),
      css('.story-featured-title').styles(
        fontSize: 32.px,
      ),
    ]),
    css.media(MediaQuery.screen(minWidth: 900.px), [
      css('.home-hero').styles(
        minHeight: 810.px,
      ),
      css('.home-hero-inner').styles(
        maxWidth: 1240.px,
        flexDirection: .row,
        alignItems: .center,
        justifyContent: .spaceBetween,
        padding: Padding.fromLTRB(24.px, 84.px, 24.px, 60.px),
        raw: {
          'gap': '120px',
        },
      ),
      css('.home-hero-avatar-wrap').styles(
        margin: Margin.only(left: 56.px, bottom: 36.px),
      ),
      css('.home-hero-text').styles(
        maxWidth: 560.px,
        width: .auto,
        margin: Margin.only(bottom: 44.px, left: 64.px),
      ),
      css('.home-hero-avatar').styles(
        width: 340.px,
        height: 340.px,
      ),
      css('.hero-title').styles(
        fontSize: 50.px,
      ),
      css('.hero-subtitle').styles(
        fontSize: 20.px,
      ),
    ]),
  ];
}
