import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/links.dart';
import '../constants/theme.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  static const _iconAttributes =
      'class="theme-icon" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"';

  static const _sunIconSvg =
      '<svg $_iconAttributes>'
      '<circle cx="12" cy="12" r="4"/>'
      '<path d="M12 2v2"/><path d="M12 20v2"/><path d="m4.93 4.93 1.41 1.41"/><path d="m17.66 17.66 1.41 1.41"/>'
      '<path d="M2 12h2"/><path d="M20 12h2"/><path d="m6.34 17.66-1.41 1.41"/><path d="m19.07 4.93-1.41 1.41"/>'
      '</svg>';

  static const _monitorIconSvg =
      '<svg $_iconAttributes>'
      '<rect width="20" height="14" x="2" y="3" rx="2"/>'
      '<path d="M8 21h8"/><path d="M12 17v4"/>'
      '</svg>';

  static const _moonIconSvg =
      '<svg $_iconAttributes>'
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
          // The theme script in main.server.dart keeps the selected option up to date.
          div(
            id: 'theme-toggle',
            classes: 'theme-toggle',
            attributes: const {'role': 'radiogroup', 'aria-label': 'Color theme'},
            [
              _themeOption('light', 'Light', _sunIconSvg),
              _themeOption('system', 'System', _monitorIconSvg),
              _themeOption('dark', 'Dark', _moonIconSvg),
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

  Component _themeOption(String value, String name, String iconSvg) {
    return label(
      classes: 'theme-option theme-option-$value',
      attributes: {'title': name},
      [
        input(
          type: InputType.radio,
          name: 'theme',
          value: value,
          attributes: {'aria-label': name, 'autocomplete': 'off'},
        ),
        RawText(iconSvg),
      ],
    );
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
            position: .relative(),
            alignItems: .center,
            padding: .all(3.px),
            border: Border.all(color: borderSubtle, width: 1.px, style: BorderStyle.solid),
            radius: .all(.circular(999.px)),
            raw: {
              '--option-size': '26px',
              'flex-shrink': '0',
              'background': 'var(--toggle-track)',
            },
          ),
          // The thumb that slides behind the selected option.
          css('.theme-toggle::before').styles(
            position: .absolute(top: 3.px, left: 3.px),
            width: Unit.variable('--option-size'),
            height: Unit.variable('--option-size'),
            radius: .all(.circular(999.px)),
            raw: {
              'content': '""',
              'background': 'var(--toggle-thumb)',
              'box-shadow': 'var(--toggle-thumb-shadow)',
              'transform': 'translateX(var(--option-size))',
              'transition': 'transform 260ms cubic-bezier(0.22, 1, 0.36, 1)',
            },
          ),
          css('.theme-option').styles(
            display: .inlineFlex,
            position: .relative(),
            alignItems: .center,
            justifyContent: .center,
            width: Unit.variable('--option-size'),
            height: Unit.variable('--option-size'),
            radius: .all(.circular(999.px)),
            color: inkMuted,
            raw: {
              'cursor': 'pointer',
              'transition': 'color 160ms ease',
            },
          ),
          css('.theme-option:hover').styles(
            color: inkPrimary,
          ),
          // Visually hidden, but still focusable and available to screen readers.
          css('.theme-option input').styles(
            position: .absolute(top: .zero, left: .zero),
            width: 100.percent,
            height: 100.percent,
            margin: .zero,
            opacity: 0,
            raw: {
              'cursor': 'pointer',
            },
          ),
          css('.theme-option:has(input:focus-visible)').styles(
            raw: {
              'outline': '2px solid var(--link-blue)',
              'outline-offset': '1px',
            },
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
    // The choice is on <html>, rather than on the inputs, so that the thumb is in the
    // right place as soon as the page paints.
    css('html[data-theme-choice="light"] .blog-header .header-content .header-nav .theme-toggle::before').styles(
      raw: {'transform': 'none'},
    ),
    css('html[data-theme-choice="dark"] .blog-header .header-content .header-nav .theme-toggle::before').styles(
      raw: {'transform': 'translateX(calc(2 * var(--option-size)))'},
    ),
    css(
      'html[data-theme-choice="light"] .blog-header .header-content .header-nav .theme-option-light, '
      'html[data-theme-choice="system"] .blog-header .header-content .header-nav .theme-option-system, '
      'html[data-theme-choice="dark"] .blog-header .header-content .header-nav .theme-option-dark',
    ).styles(
      color: inkPrimary,
    ),
    css.media(MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
      css('.blog-header .header-content .header-nav .theme-toggle::before').styles(
        raw: {'transition': 'none'},
      ),
    ]),
    // The toggle can't do anything without JavaScript.
    css.media(MediaQuery.raw('(scripting: none)'), [
      css('.blog-header .header-content .header-nav .theme-toggle').styles(
        display: .none,
      ),
    ]),
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
      // Pin the toggle to the corner, because it doesn't fit beside the links.
      css('.blog-header .header-content .header-nav .theme-toggle').styles(
        position: .absolute(top: 27.px, right: 24.px),
        raw: {'--option-size': '30px'},
      ),
      // Line up with the back link.
      css('.blog-header.blog-header-post .header-content .header-nav .theme-toggle').styles(
        position: .absolute(top: 6.px, right: 24.px),
      ),
    ]),
    css.media(MediaQuery.screen(minWidth: 760.px), [
      css('.blog-header .nav-external').styles(
        display: .inline,
      ),
    ]),
  ];
}
