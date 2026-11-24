import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/links.dart';
import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  static const _sunIconSvg =
      '<svg class="theme-icon icon-sun" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
      '<circle cx="12" cy="12" r="4"/>'
      '<path d="M12 2v2"/><path d="M12 20v2"/><path d="m4.93 4.93 1.41 1.41"/><path d="m17.66 17.66 1.41 1.41"/>'
      '<path d="M2 12h2"/><path d="M20 12h2"/><path d="m6.34 17.66-1.41 1.41"/><path d="m19.07 4.93-1.41 1.41"/>'
      '</svg>';

  static const _moonIconSvg =
      '<svg class="theme-icon icon-moon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
      '<path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"/>'
      '</svg>';

  @override
  Component build(BuildContext context) {
    final activePath = context.url;
    final isPostPage = activePath.startsWith('/post/');

    return header(classes: isPostPage ? 'blog-header blog-header-post' : 'blog-header', [
      div(classes: 'header-content', [
        div(classes: 'header-left', [
          if (isPostPage)
            a(href: '/', classes: 'header-back-link', [.text('← All product designs')]),
        ]),
        a(
          href: SiteLinks.mainSite,
          classes: 'header-logo-link',
          attributes: const {'aria-label': 'superdeclarative.com'},
          [
            img(
              src: '/images/favicon/android-chrome-256x256.png',
              alt: 'SuperDeclarative',
              classes: 'header-logo-circle',
            ),
          ],
        ),
        nav(classes: 'header-nav', [
          div(classes: 'header-nav-links', [
            div(
              classes: [
                'nav-item',
                if (activePath == '/') 'active',
                if (isPostPage) 'nav-item-post-mobile-only',
              ].join(' '),
              [
                Link(to: '/', child: .text('Product Designs')),
              ],
            ),
            div(classes: activePath == '/about' ? 'nav-item active' : 'nav-item', [
              Link(to: '/about', child: .text('About')),
            ]),
          ]),
          button(
            id: 'theme-toggle',
            type: ButtonType.button,
            classes: 'theme-toggle',
            attributes: const {'aria-label': 'Toggle light or dark mode', 'title': 'Toggle light or dark mode'},
            [
              const RawText(_sunIconSvg),
              const RawText(_moonIconSvg),
            ],
          ),
          a(
            href: SiteLinks.mainSite,
            classes: 'nav-external',
            attributes: const {'target': '_blank', 'rel': 'noopener noreferrer'},
            [.text('superdeclarative.com ↗')],
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css.keyframes('headerFadeIn', {
      'from': const Styles(opacity: 0),
      'to': const Styles(opacity: 1),
    }),
    css('.blog-header.blog-header-post').styles(
      raw: {
        'animation': 'headerFadeIn 850ms cubic-bezier(0.22, 1, 0.36, 1) 1150ms both',
      },
    ),
    css('.blog-header', [
      css('&').styles(
        width: 100.percent,
        display: .flex,
        justifyContent: .center,
        position: .absolute(top: .zero, left: .zero, right: .zero),
        zIndex: ZIndex(50),
        backgroundColor: Colors.transparent,
      ),
      css('.header-content', [
        css('&').styles(
          maxWidth: 1080.px,
          width: 100.percent,
          padding: Padding.symmetric(horizontal: 24.px, vertical: 20.px),
          display: .grid,
          alignItems: .center,
          raw: {
            'grid-template-columns': '1fr auto 1fr',
            'gap': '16px',
          },
        ),
        css('.header-left').styles(
          display: .flex,
          alignItems: .center,
          raw: {
            'justify-self': 'start',
          },
        ),
        css('.header-back-link').styles(
          fontFamily: fontSans,
          color: inkMuted,
          textDecoration: .none,
          fontSize: 14.px,
          fontWeight: FontWeight.w400,
          raw: {
            'white-space': 'nowrap',
          },
        ),
        css('.header-back-link:hover').styles(
          color: inkPrimary,
        ),
        css('.header-logo-link').styles(
          display: .inlineFlex,
          alignItems: .center,
          justifyContent: .center,
          radius: .all(.circular(999.px)),
          raw: {
            'justify-self': 'center',
            'transition': 'transform 180ms ease, box-shadow 180ms ease',
          },
        ),
        css('.header-logo-link:hover').styles(
          raw: {
            'transform': 'scale(1.06)',
            'box-shadow': '0 0 20px rgba(255, 237, 75, 0.35)',
          },
        ),
        css('.header-logo-circle').styles(
          width: 36.px,
          height: 36.px,
          radius: .all(.circular(999.px)),
          display: .block,
          border: Border.all(color: borderMedium, width: 1.px, style: BorderStyle.solid),
          raw: {
            'object-fit': 'cover',
          },
        ),
        css('.header-nav', [
          css('&').styles(
            display: .flex,
            alignItems: .center,
            raw: {
              'justify-self': 'end',
              'gap': '24px',
            },
          ),
          css('.header-nav-links').styles(
            display: .flex,
            alignItems: .center,
            raw: {
              'gap': '24px',
            },
          ),
          css('.nav-item-post-mobile-only').styles(
            display: .none,
          ),
          css('.nav-item', [
            css('a').styles(
              color: inkMuted,
              textDecoration: .none,
              fontWeight: FontWeight.w400,
              fontSize: 14.px,
              raw: {
                'white-space': 'nowrap',
              },
            ),
            css('a:hover').styles(
              color: inkPrimary,
            ),
          ]),
          css('.nav-item.active', [
            css('a').styles(
              color: inkPrimary,
              fontWeight: FontWeight.w500,
            ),
          ]),
          css('.theme-toggle').styles(
            display: .inlineFlex,
            alignItems: .center,
            justifyContent: .center,
            width: 32.px,
            height: 32.px,
            padding: .zero,
            backgroundColor: Colors.transparent,
            border: Border.all(color: borderMedium, width: 1.px, style: BorderStyle.solid),
            radius: .all(.circular(999.px)),
            color: inkSecondary,
            raw: {
              'cursor': 'pointer',
              'transition': 'color 160ms ease, border-color 160ms ease, background-color 160ms ease',
            },
          ),
          css('.theme-toggle:hover').styles(
            color: inkPrimary,
            backgroundColor: bgElevated,
            border: Border.all(color: borderMedium, width: 1.px, style: BorderStyle.solid),
          ),
          css('.nav-external').styles(
            display: .none,
            color: inkSecondary,
            textDecoration: .none,
            fontSize: 14.px,
            fontWeight: FontWeight.w400,
            raw: {
              'white-space': 'nowrap',
            },
          ),
          css('.nav-external:hover').styles(
            color: accentIndigoBright,
          ),
        ]),
      ]),
    ]),
    css('.theme-toggle .icon-moon').styles(
      display: .none,
    ),
    css('html[data-theme="light"] .theme-toggle .icon-sun').styles(
      display: .none,
    ),
    css('html[data-theme="light"] .theme-toggle .icon-moon').styles(
      display: .block,
    ),
    css.media(MediaQuery.screen(maxWidth: 519.px), [
      css('.blog-header .header-content').styles(
        padding: Padding.symmetric(horizontal: 24.px, vertical: 16.px),
        raw: {
          'grid-template-columns': '1fr',
          'justify-items': 'center',
          'gap': '12px',
        },
      ),
      css('.blog-header .header-left').styles(
        display: .none,
      ),
      css('.blog-header .header-nav').styles(
        display: .grid,
        width: 100.percent,
        raw: {
          'grid-template-columns': '1fr auto 1fr',
          'justify-self': 'stretch',
          'gap': '12px',
        },
      ),
      css('.blog-header .header-nav-links').styles(
        justifyContent: .center,
        raw: {
          'grid-column': '2',
          'justify-self': 'center',
          'gap': '28px',
        },
      ),
      css('.blog-header .nav-item-post-mobile-only').styles(
        display: .block,
      ),
      css('.blog-header .nav-item a').styles(
        display: .inlineBlock,
        padding: Padding.symmetric(vertical: 6.px, horizontal: 4.px),
      ),
      css('.blog-header .theme-toggle').styles(
        raw: {
          'grid-column': '3',
          'justify-self': 'end',
        },
      ),
    ]),
    css.media(MediaQuery.screen(minWidth: 760.px), [
      css('.blog-header .nav-external').styles(
        display: .inline,
      ),
    ]),
  ];
}
