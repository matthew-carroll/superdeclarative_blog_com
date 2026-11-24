import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/links.dart';
import '../constants/theme.dart';
import '../models/post.dart';

class PostPage extends StatelessComponent {
  const PostPage({required this.id, super.key});

  final String id;

  @override
  Component build(BuildContext context) {
    final post = mockPosts.firstWhere(
      (post) => post.id == id,
      orElse: () => const BlogPost(
        id: 'not-found',
        title: 'Product Design Not Found',
        date: '',
        excerpt: '',
        content: '<p>Sorry, the requested article could not be found.</p>',
        headings: [],
      ),
    );

    final readingMinutes = estimateReadingMinutes(post.content);

    return section(classes: 'post-page', [
      // Dedicated Full-Bleed Modern Publishing × Dark AI Hero Section
      header(classes: 'post-hero', [
        div(classes: 'post-hero-aurora', []),
        div(classes: 'post-hero-inner', [
          img(
            src: '/images/hero-avatar.png',
            alt: 'Matt Carroll',
            classes: 'post-hero-avatar post-hero-avatar-dark',
          ),
          img(
            src: '/images/hero-avatar-light.png?v=2',
            alt: 'Matt Carroll',
            classes: 'post-hero-avatar post-hero-avatar-light',
          ),
          span(classes: 'post-hero-category', [.text('PRODUCT DESIGN')]),
          h1(classes: 'post-hero-title', [.text(post.title)]),
          div(classes: 'post-byline', [
            div(classes: 'byline-text', [
              span(classes: 'byline-author', [.text('Matt Carroll')]),
              span(
                classes: 'byline-org',
                styles: const Styles(color: brandYellow),
                [.text('SuperDeclarative!')],
              ),
              div(classes: 'byline-meta', [
                span([.text('$readingMinutes min read')]),
                if (post.date.isNotEmpty) ...[
                  span(classes: 'byline-dot', [.text('·')]),
                  span([.text(post.date)]),
                ],
              ]),
            ]),
          ]),
        ]),
      ]),

      // Centered Medium-Style Reading Canvas (+ Quiet Side TOC on Wide Screens)
      div(classes: 'post-layout', [
        div(classes: 'post-left-spacer', []),
        article(classes: 'post-body', [
          if (post.excerpt.isNotEmpty)
            p(classes: 'post-lead-callout', [.text(post.excerpt)]),
          div(classes: 'post-content', [
            RawText(post.content),
          ]),
          div(classes: 'post-end', [
            a(href: '/', classes: 'post-end-link', [.text('← Back to all product designs')]),
          ]),
        ]),
        div(classes: 'post-right-rail', [
          if (post.headings.isNotEmpty)
            aside(classes: 'post-toc', [
              div(classes: 'toc-title', [.text('CONTENTS')]),
              ul(classes: 'toc-list', [
                for (final heading in post.headings)
                  li(classes: 'toc-item level-${heading.level}', [
                    a(
                      href:
                          '/post/${post.id}#${heading.text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9 ]'), '').replaceAll(" ", "-")}',
                      [.text(heading.text)],
                    ),
                  ]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css.keyframes('heroFadeSlideUp', {
      'from': const Styles(
        opacity: 0,
        raw: {'transform': 'translateY(24px)'},
      ),
      'to': const Styles(
        opacity: 1,
        raw: {'transform': 'translateY(0)'},
      ),
    }),
    css.keyframes('heroFadeSlideDown', {
      'from': const Styles(
        opacity: 0,
        raw: {'transform': 'translateY(-20px)'},
      ),
      'to': const Styles(
        opacity: 1,
        raw: {'transform': 'translateY(0)'},
      ),
    }),
    css.keyframes('heroFadeIn', {
      'from': const Styles(opacity: 0),
      'to': const Styles(opacity: 1),
    }),
    css.keyframes('heroFadeSlideRight', {
      'from': const Styles(
        opacity: 0,
        raw: {'transform': 'translateX(-36px)'},
      ),
      'to': const Styles(
        opacity: 1,
        raw: {'transform': 'translateX(0)'},
      ),
    }),
    css.keyframes('heroAvatarFloat', {
      '0%, 100%': const Styles(
        raw: {'transform': 'translateY(0px)'},
      ),
      '50%': const Styles(
        raw: {'transform': 'translateY(-8px)'},
      ),
    }),
    css('.post-page').styles(
      width: 100.percent,
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      backgroundColor: bgCanvas,
    ),

    // ---------------- POST HERO ----------------
    css('.post-hero').styles(
      width: 100.percent,
      minHeight: 540.px,
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
    css('.post-hero-aurora').styles(
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
    css('.post-hero-inner').styles(
      position: .relative(),
      zIndex: ZIndex(2),
      maxWidth: 760.px,
      width: 100.percent,
      padding: Padding.fromLTRB(24.px, 96.px, 24.px, 48.px),
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      textAlign: .center,
    ),
    css('.post-hero-avatar').styles(
      width: 324.px,
      height: 324.px,
      radius: .all(.circular(999.px)),
      margin: Margin.only(bottom: 24.px),
      raw: {
        'object-fit': 'cover',
        'mask-image': 'radial-gradient(circle closest-side at 50% 50%, black 80%, transparent 100%)',
        '-webkit-mask-image': 'radial-gradient(circle closest-side at 50% 50%, black 80%, transparent 100%)',
        'animation':
            'heroFadeSlideUp 950ms cubic-bezier(0.22, 1, 0.36, 1) 0ms both, '
            'heroAvatarFloat 4.8s ease-in-out 950ms infinite',
      },
    ),
    css('.post-hero-avatar-light').styles(
      display: .none,
    ),
    css('html[data-theme="light"] .post-hero-avatar-dark').styles(
      display: .none,
    ),
    css('html[data-theme="light"] .post-hero-avatar-light').styles(
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
    css('.post-hero-category').styles(
      fontFamily: fontSans,
      fontSize: 12.px,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.8.px,
      color: inkSecondary,
      margin: Margin.only(bottom: 12.px),
      raw: {
        'animation': 'heroFadeSlideUp 900ms cubic-bezier(0.22, 1, 0.36, 1) 220ms both',
      },
    ),
    css('.post-hero-title').styles(
      fontFamily: fontSans,
      fontSize: 38.px,
      fontWeight: FontWeight.w800,
      lineHeight: 1.12.em,
      letterSpacing: (-1.2).px,
      color: inkPrimary,
      margin: Margin.only(bottom: 64.px),
      raw: {
        'text-wrap': 'balance',
        'animation': 'heroFadeSlideUp 900ms cubic-bezier(0.22, 1, 0.36, 1) 220ms both',
      },
    ),
    css('.post-byline').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      justifyContent: .center,
      textAlign: .center,
      raw: {
        'animation': 'heroFadeSlideUp 850ms cubic-bezier(0.22, 1, 0.36, 1) 360ms both',
      },
    ),
    css('.byline-text').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      textAlign: .center,
      raw: {
        'gap': '4px',
      },
    ),
    css('.byline-author').styles(
      fontSize: 15.px,
      fontWeight: FontWeight.w500,
      color: inkPrimary,
    ),
    css('.byline-org').styles(
      fontSize: 14.px,
      fontWeight: FontWeight.w600,
      color: brandYellow,
      margin: Margin.only(bottom: 2.px),
    ),
    css('.byline-meta').styles(
      display: .flex,
      alignItems: .center,
      justifyContent: .center,
      fontSize: 13.5.px,
      color: inkMuted,
      raw: {
        'gap': '6px',
      },
    ),
    css('.byline-dot').styles(
      color: inkMuted,
    ),

    // ---------------- READING LAYOUT ----------------
    css('.post-layout').styles(
      width: 100.percent,
      maxWidth: 680.px,
      padding: Padding.fromLTRB(24.px, 48.px, 24.px, 96.px),
      display: .flex,
      flexDirection: .column,
    ),
    css('.post-left-spacer, .post-right-rail').styles(
      display: .none,
    ),
    css('.post-toc').styles(
      raw: {
        'animation': 'heroFadeSlideRight 900ms cubic-bezier(0.22, 1, 0.36, 1) 700ms both',
      },
    ),
    css('.post-body').styles(
      width: 100.percent,
      display: .flex,
      flexDirection: .column,
      raw: {
        'animation': 'heroFadeIn 900ms cubic-bezier(0.22, 1, 0.36, 1) 520ms both',
      },
    ),

    // Editorial Lead Tagline at the top of the article
    css('.post-lead-callout').styles(
      fontFamily: fontSerif,
      fontSize: 28.px,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      lineHeight: 1.4.em,
      textAlign: .center,
      color: brandYellow,
      maxWidth: 580.px,
      padding: Padding.symmetric(vertical: 28.px),
      margin: Margin.fromLTRB(.auto, 12.px, .auto, 52.px),
      raw: {
        'letter-spacing': '-0.01em',
        'text-wrap': 'balance',
      },
    ),

    // Medium-Inspired Long-Form Serif Prose (Source Serif 4 @ 20px) + Bold Sans Headings
    css('.post-content').styles(
      fontFamily: fontSerif,
      fontSize: 20.px,
      lineHeight: 1.68.em,
      color: inkProse,
      fontWeight: FontWeight.w400,
      raw: {
        'letter-spacing': '-0.003em',
      },
    ),
    css('.post-content p').styles(
      margin: Margin.only(bottom: 28.px),
      lineHeight: 1.68.em,
    ),
    css('.post-content strong').styles(
      color: inkPrimary,
      fontWeight: FontWeight.w600,
    ),
    css('.post-content em').styles(
      fontStyle: FontStyle.italic,
    ),
    css('.post-content a, .post-content a:visited').styles(
      raw: {
        'color': 'var(--link-blue, #60A5FA)',
        'text-decoration': 'underline',
        'text-decoration-color': 'var(--link-underline, rgba(96, 165, 250, 0.55))',
        'text-underline-offset': '3px',
      },
    ),
    css('.post-content a:hover').styles(
      raw: {
        'color': 'var(--link-blue-hover, #93C5FD)',
        'text-decoration-color': 'var(--link-underline-hover, rgba(147, 197, 253, 0.9))',
      },
    ),
    css('.post-content h2').styles(
      fontFamily: fontSans,
      fontSize: 26.px,
      fontWeight: FontWeight.w700,
      lineHeight: 1.25.em,
      color: inkPrimary,
      margin: Margin.only(top: 48.px, bottom: 14.px),
      letterSpacing: (-0.5).px,
      raw: {
        'scroll-margin-top': '90px',
      },
    ),
    css('.post-content h3').styles(
      fontFamily: fontSans,
      fontSize: 20.px,
      fontWeight: FontWeight.w700,
      lineHeight: 1.32.em,
      color: inkPrimary,
      margin: Margin.only(top: 36.px, bottom: 10.px),
      letterSpacing: (-0.3).px,
      raw: {
        'scroll-margin-top': '90px',
      },
    ),
    css('.post-content ul, .post-content ol').styles(
      margin: Margin.only(bottom: 28.px),
      padding: Padding.only(left: 26.px),
    ),
    css('.post-content li').styles(
      margin: Margin.only(bottom: 12.px),
      lineHeight: 1.65.em,
    ),
    css('.post-content blockquote').styles(
      margin: Margin.symmetric(vertical: 32.px),
      padding: Padding.fromLTRB(22.px, 4.px, 0.px, 4.px),
      border: Border.only(
        left: BorderSide(style: BorderStyle.solid, width: 3.px, color: accentIndigo),
      ),
      fontFamily: fontSerif,
      fontStyle: FontStyle.italic,
      fontSize: 21.px,
      lineHeight: 1.62.em,
      color: inkSecondary,
    ),
    css('.post-content code').styles(
      fontFamily: fontMono,
      fontSize: 15.px,
      color: accentIndigoBright,
      backgroundColor: bgSurface,
      padding: Padding.symmetric(horizontal: 6.px, vertical: 2.px),
      radius: .all(.circular(5.px)),
    ),
    css('.post-content pre').styles(
      backgroundColor: bgElevated,
      border: Border.all(color: borderSubtle, width: 1.px, style: BorderStyle.solid),
      radius: .all(.circular(10.px)),
      padding: Padding.all(20.px),
      margin: Margin.only(bottom: 28.px),
      overflow: .auto,
    ),
    css('.post-content pre code').styles(
      backgroundColor: Colors.transparent,
      padding: .zero,
      color: inkProse,
      fontSize: 14.px,
      lineHeight: 1.6.em,
    ),
    css('.post-content hr').styles(
      border: Border.all(style: BorderStyle.none),
      height: 1.px,
      width: 120.px,
      margin: Margin.symmetric(vertical: 48.px, horizontal: .auto),
      raw: {
        'background': 'var(--hr-gradient)',
      },
    ),
    css('.post-end').styles(
      margin: Margin.only(top: 52.px),
      padding: Padding.only(top: 28.px),
      border: Border.only(
        top: BorderSide(style: BorderStyle.solid, width: 1.px, color: borderSubtle),
      ),
    ),
    css('.post-end-link').styles(
      fontFamily: fontSans,
      fontSize: 14.px,
      fontWeight: FontWeight.w400,
      color: inkMuted,
      textDecoration: .none,
    ),
    css('.post-end-link:hover').styles(
      color: inkPrimary,
    ),

    // ---------------- RESPONSIVE ----------------
    css.media(MediaQuery.screen(minWidth: 640.px), [
      css('.post-hero').styles(
        minHeight: 680.px,
      ),
      css('.post-hero-inner').styles(
        padding: Padding.fromLTRB(24.px, 108.px, 24.px, 56.px),
      ),
      css('.post-hero-avatar').styles(
        width: 384.px,
        height: 384.px,
      ),
      css('.post-hero-title').styles(
        fontSize: 50.px,
      ),
      css('.post-lead-callout').styles(
        fontSize: 32.px,
      ),
    ]),

    // Keep the 680px reading column mathematically dead-center on wide viewports,
    // with up to 200px of breathing room between the content and the TOC when space permits.
    css.media(MediaQuery.screen(minWidth: 1240.px), [
      css('.post-layout').styles(
        maxWidth: 100.percent,
        flexDirection: .row,
        justifyContent: .center,
        alignItems: .start,
        raw: {
          'gap': 'clamp(32px, calc((100vw - 1168px) / 2), 200px)',
        },
      ),
      css('.post-left-spacer').styles(
        display: .block,
        width: 220.px,
        raw: {
          'flex-shrink': '0',
        },
      ),
      css('.post-body').styles(
        maxWidth: 680.px,
        width: 680.px,
        raw: {
          'flex-shrink': '0',
        },
      ),
      css('.post-right-rail').styles(
        display: .block,
        width: 220.px,
        position: .sticky(top: 96.px),
        raw: {
          'flex-shrink': '0',
        },
      ),
      css('.post-toc', [
        css('&').styles(
          padding: Padding.only(left: 28.px),
          border: Border.only(
            left: BorderSide(style: BorderStyle.solid, width: 1.px, color: borderSubtle),
          ),
        ),
        css('.toc-title').styles(
          fontFamily: fontSans,
          fontSize: 10.5.px,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.4.px,
          color: inkSecondary,
          margin: Margin.only(bottom: 18.px),
        ),
        css('.toc-list').styles(
          listStyle: .none,
          padding: .zero,
          margin: .zero,
        ),
        css('.toc-item', [
          css('&').styles(
            margin: Margin.only(bottom: 15.px),
          ),
          css('a').styles(
            color: inkMuted,
            textDecoration: .none,
            fontFamily: fontSans,
            fontSize: 15.px,
            lineHeight: 1.45.em,
            display: .block,
          ),
          css('a:hover').styles(
            color: inkPrimary,
          ),
        ]),
        css('.toc-item.level-3', [
          css('&').styles(
            padding: Padding.only(left: 12.px),
            margin: Margin.only(bottom: 12.px),
          ),
          css('a').styles(
            fontSize: 14.px,
            raw: {
              'opacity': '0.8',
            },
          ),
        ]),
      ]),
    ]),
  ];
}
