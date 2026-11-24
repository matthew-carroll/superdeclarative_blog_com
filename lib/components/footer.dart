import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/links.dart';
import '../constants/theme.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  static const _xIconSvg =
      '<svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">'
      '<path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>'
      '</svg>';

  static const _linkedInIconSvg =
      '<svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">'
      '<path d="M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14m-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.28 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93h2.75M6.88 8.56a1.68 1.68 0 0 0 1.68-1.68c0-.93-.75-1.69-1.68-1.69a1.69 1.69 0 0 0-1.69 1.69c0 .93.76 1.68 1.69 1.68m1.39 9.94v-8.37H5.5v8.37h2.77z"/>'
      '</svg>';

  static const _siteIconSvg =
      '<svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">'
      '<circle cx="12" cy="12" r="10"/>'
      '<line x1="2" y1="12" x2="22" y2="12"/>'
      '<path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>'
      '</svg>';

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'footer-inner', [
        nav(classes: 'footer-links', [
          a(
            href: SiteLinks.xAccount,
            target: Target.blank,
            classes: 'footer-link',
            attributes: const {'rel': 'noopener noreferrer', 'aria-label': 'X (Twitter)'},
            [
              span(classes: 'footer-icon', [const RawText(_xIconSvg)]),
              span([.text(SiteLinks.xHandle)]),
            ],
          ),
          a(
            href: SiteLinks.linkedIn,
            target: Target.blank,
            classes: 'footer-link',
            attributes: const {'rel': 'noopener noreferrer', 'aria-label': 'LinkedIn'},
            [
              span(classes: 'footer-icon', [const RawText(_linkedInIconSvg)]),
              span([.text('Matt Carroll')]),
            ],
          ),
          a(
            href: SiteLinks.mainSite,
            target: Target.blank,
            classes: 'footer-link',
            attributes: const {'rel': 'noopener noreferrer', 'aria-label': 'superdeclarative.com'},
            [
              span(classes: 'footer-icon', [const RawText(_siteIconSvg)]),
              span([.text('superdeclarative.com')]),
            ],
          ),
        ]),
        div(classes: 'footer-copyright', [
          span(classes: 'footer-brand', [
            span(classes: 'footer-brand-super', [.text('Super')]),
            span(classes: 'footer-brand-declarative', [.text('Declarative')]),
          ]),
          span(classes: 'footer-copy', [.text('© 2026 Declarative Inc')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.site-footer', [
      css('&').styles(
        width: 100.percent,
        position: .relative(),
        backgroundColor: bgCanvas,
        border: Border.only(
          top: BorderSide(style: BorderStyle.solid, width: 1.px, color: borderSubtle),
        ),
        display: .flex,
        justifyContent: .center,
      ),
      css('.footer-inner').styles(
        maxWidth: 1080.px,
        width: 100.percent,
        padding: Padding.fromLTRB(24.px, 44.px, 24.px, 76.px),
        display: .flex,
        flexDirection: .column,
        alignItems: .center,
        raw: {
          'gap': '36px',
        },
      ),
      css('.footer-links').styles(
        display: .flex,
        flexWrap: .wrap,
        justifyContent: .center,
        alignItems: .center,
        raw: {
          'gap': '28px',
        },
      ),
      css('.footer-link').styles(
        display: .inlineFlex,
        alignItems: .center,
        color: inkSecondary,
        textDecoration: .none,
        fontSize: 14.px,
        fontWeight: FontWeight.w400,
        raw: {
          'gap': '7px',
        },
      ),
      css('.footer-link:hover').styles(
        color: inkPrimary,
      ),
      css('.footer-icon').styles(
        display: .inlineFlex,
        alignItems: .center,
        justifyContent: .center,
        raw: {
          'opacity': '0.85',
        },
      ),
      css('.footer-copyright').styles(
        display: .flex,
        alignItems: .center,
        justifyContent: .center,
        raw: {
          'gap': '12px',
        },
      ),
      css('.footer-brand').styles(
        fontSize: 15.px,
        fontWeight: FontWeight.w700,
        color: inkPrimary,
        letterSpacing: (-0.3).px,
      ),
      css('.footer-brand-super').styles(
        color: inkPrimary,
      ),
      css('.footer-brand-declarative').styles(
        color: brandYellow,
      ),
      css('.footer-copy').styles(
        fontSize: 14.px,
        color: inkMuted,
      ),
    ]),
  ];
}
