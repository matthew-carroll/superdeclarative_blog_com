import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../models/post.dart';

class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    final aboutPost = mockPosts.firstWhere(
      (post) => post.id == 'about',
      orElse: () => const BlogPost(
        id: 'about',
        title: 'About SuperDeclarative',
        date: '',
        excerpt: '',
        content: '<p>SuperDeclarative is a boutique consultancy dedicated to premium Flutter services.</p>',
        headings: [],
      ),
    );

    return section(classes: 'about-page', [
      header(classes: 'about-hero', [
        div(classes: 'about-hero-aurora', []),
        div(classes: 'about-hero-inner', [
          img(
            src: '/images/hero-avatar.png',
            alt: 'Matt Carroll',
            classes: 'about-hero-avatar about-hero-avatar-dark',
          ),
          img(
            src: '/images/hero-avatar-light.png?v=2',
            alt: 'Matt Carroll',
            classes: 'about-hero-avatar about-hero-avatar-light',
          ),
          h1(classes: 'about-hero-title', [.text('Product Design Blog')]),
          p(classes: 'about-hero-subtitle', [
            .text('How I design, build, and improve products.'),
          ]),
        ]),
      ]),
      div(classes: 'about-container', [
        div(classes: 'about-content', [
          RawText(aboutPost.content),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.about-page').styles(
      width: 100.percent,
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      backgroundColor: bgCanvas,
    ),
    css('.about-hero').styles(
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
    css('.about-hero-aurora').styles(
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
    css('.about-hero-inner').styles(
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
    css('.about-hero-avatar').styles(
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
    css('.about-hero-avatar-light').styles(
      display: .none,
    ),
    css('html[data-theme="light"] .about-hero-avatar-dark').styles(
      display: .none,
    ),
    css('html[data-theme="light"] .about-hero-avatar-light').styles(
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
    css('.about-hero-title').styles(
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
    css('.about-hero-subtitle').styles(
      fontFamily: fontSans,
      fontSize: 18.px,
      lineHeight: 1.52.em,
      color: inkSecondary,
      fontWeight: FontWeight.w400,
      maxWidth: 540.px,
      raw: {
        'text-wrap': 'balance',
        'animation': 'heroFadeSlideUp 850ms cubic-bezier(0.22, 1, 0.36, 1) 360ms both',
      },
    ),
    css('.about-container').styles(
      maxWidth: 680.px,
      width: 100.percent,
      padding: Padding.fromLTRB(24.px, 48.px, 24.px, 96.px),
      display: .flex,
      flexDirection: .column,
      raw: {
        'animation': 'heroFadeIn 900ms cubic-bezier(0.22, 1, 0.36, 1) 520ms both',
      },
    ),
    css('.about-content').styles(
      fontFamily: fontSerif,
      fontSize: 20.px,
      lineHeight: 1.68.em,
      color: inkProse,
      fontWeight: FontWeight.w400,
    ),
    css('.about-content p').styles(
      margin: Margin.only(bottom: 26.px),
      lineHeight: 1.68.em,
    ),
    css('.about-content h2').styles(
      fontFamily: fontSans,
      fontSize: 26.px,
      fontWeight: FontWeight.w700,
      color: inkPrimary,
      margin: Margin.only(top: 44.px, bottom: 14.px),
      letterSpacing: (-0.5).px,
    ),
    css('.about-content h3').styles(
      fontFamily: fontSans,
      fontSize: 20.px,
      fontWeight: FontWeight.w700,
      color: inkPrimary,
      margin: Margin.only(top: 36.px, bottom: 12.px),
      letterSpacing: (-0.3).px,
    ),
    css('.about-content ul').styles(
      padding: Padding.only(left: 24.px),
      margin: Margin.only(bottom: 26.px),
    ),
    css('.about-content li').styles(
      margin: Margin.only(bottom: 10.px),
    ),
    css('.about-content a, .about-content a:visited').styles(
      raw: {
        'color': 'var(--link-blue, #60A5FA)',
        'text-decoration': 'underline',
        'text-decoration-color': 'var(--link-underline, rgba(96, 165, 250, 0.55))',
        'text-underline-offset': '3px',
      },
    ),
    css('.about-content a:hover').styles(
      raw: {
        'color': 'var(--link-blue-hover, #93C5FD)',
      },
    ),

    // ---------------- RESPONSIVE ----------------
    css.media(MediaQuery.screen(minWidth: 640.px), [
      css('.about-hero').styles(
        minHeight: 680.px,
      ),
      css('.about-hero-inner').styles(
        padding: Padding.fromLTRB(24.px, 108.px, 24.px, 56.px),
      ),
      css('.about-hero-avatar').styles(
        width: 384.px,
        height: 384.px,
      ),
      css('.about-hero-title').styles(
        fontSize: 50.px,
      ),
      css('.about-hero-subtitle').styles(
        fontSize: 20.px,
      ),
    ]),
  ];
}
