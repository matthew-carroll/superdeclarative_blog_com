import 'package:jaspr/dom.dart';

// ---------------------------------------------------------------------------
// Modern Publishing (Medium-inspired) × Modern Dark AI Palette
// Uses CSS custom properties so dark/light mode switches seamlessly.
// ---------------------------------------------------------------------------

// Surfaces (CSS variables)
const bgCanvas = Color.variable('--bg-canvas');
const bgElevated = Color.variable('--bg-elevated');
const bgSurface = Color.variable('--bg-surface');

// Hairlines & Borders
const borderSubtle = Color.variable('--border-subtle');
const borderMedium = Color.variable('--border-medium');
const borderAccent = Color('#818CF84D');

// Typography Inks
const inkPrimary = Color.variable('--ink-primary');
const inkProse = Color.variable('--ink-prose');
const inkSecondary = Color.variable('--ink-secondary');
const inkMuted = Color.variable('--ink-muted');

// Official Brand Yellow (adapts to warm readable gold in light mode)
const brandYellow = Color.variable('--brand-yellow');

// Dark AI Accents (Electric Indigo · Soft Violet · Luminous Cyan)
const accentIndigo = Color('#818CF8');
const accentIndigoBright = Color.variable('--accent-indigo-bright');
const accentIndigoSolid = Color('#6366F1');
const accentViolet = Color('#C084FC');
const accentCyan = Color('#38BDF8');
const accentHotPink = Color('#FF2E9F');
const linkBlue = Color.variable('--link-blue');
const linkBlueHover = Color.variable('--link-blue-hover');
const primaryColor = accentIndigo;

// Font Stacks (Medium paradigm: clean sans for headlines/UI, editorial serif for long-form prose)
const fontSans = FontFamily.list([
  FontFamily('Inter'),
  FontFamily('-apple-system'),
  FontFamily('BlinkMacSystemFont'),
  FontFamilies.sansSerif,
]);

const fontSerif = FontFamily.list([
  FontFamily('Source Serif 4'),
  FontFamily('Georgia'),
  FontFamilies.serif,
]);

const fontMono = FontFamily.list([
  FontFamily('JetBrains Mono'),
  FontFamilies.monospace,
]);

@css
List<StyleRule> get styles => [
  css(':root').styles(
    raw: {
      '--bg-canvas': '#141416',
      '--bg-elevated': '#1A1A1D',
      '--bg-surface': '#222226',
      '--border-subtle': 'rgba(255, 255, 255, 0.08)',
      '--border-medium': 'rgba(255, 255, 255, 0.16)',
      '--ink-primary': '#F7F8FC',
      '--ink-prose': '#E2E5F0',
      '--ink-secondary': '#A4ACC2',
      '--ink-muted': '#788199',
      '--brand-yellow': '#FFED4B',
      '--accent-indigo-bright': '#A5B4FC',
      '--hero-bg': 'linear-gradient(180deg, #1C1C20 0%, #141416 100%)',
      '--hero-aurora':
          'radial-gradient(ellipse at 32% 45%, rgba(135, 138, 168, 0.11) 0%, transparent 56%), '
          'radial-gradient(ellipse at 68% 40%, rgba(125, 152, 168, 0.07) 0%, transparent 54%), '
          'radial-gradient(ellipse at 50% 68%, rgba(152, 134, 168, 0.06) 0%, transparent 58%)',
      '--hero-title-gradient': 'linear-gradient(115deg, #F7F8FC 0%, #A5B4FC 55%, #38BDF8 100%)',
      '--featured-bg': 'linear-gradient(160deg, rgba(32, 32, 36, 0.92) 0%, rgba(24, 24, 27, 0.92) 100%)',
      '--featured-shadow': 'inset 0 1px 0 rgba(255, 255, 255, 0.06)',
      '--link-blue': '#60A5FA',
      '--link-blue-hover': '#93C5FD',
      '--link-underline': 'rgba(96, 165, 250, 0.55)',
      '--link-underline-hover': 'rgba(147, 197, 253, 0.9)',
      '--hr-gradient': 'linear-gradient(90deg, transparent 0%, rgba(129, 140, 248, 0.55) 50%, transparent 100%)',
      '--selection-bg': 'rgba(99, 102, 241, 0.35)',
      '--selection-ink': '#FFFFFF',
      '--toggle-track': 'rgba(255, 255, 255, 0.04)',
      '--toggle-thumb': 'rgba(255, 255, 255, 0.12)',
      '--toggle-thumb-shadow': 'inset 0 1px 0 rgba(255, 255, 255, 0.08)',
    },
  ),
  css('html[data-theme="light"]').styles(
    raw: {
      '--bg-canvas': '#FAF9F6',
      '--bg-elevated': '#F1EFEA',
      '--bg-surface': '#E8E5DE',
      '--border-subtle': 'rgba(20, 20, 22, 0.09)',
      '--border-medium': 'rgba(20, 20, 22, 0.18)',
      '--ink-primary': '#141416',
      '--ink-prose': '#242428',
      '--ink-secondary': '#4E5261',
      '--ink-muted': '#686D7E',
      '--brand-yellow': '#EAB308',
      '--accent-indigo-bright': '#4F46E5',
      '--hero-bg': 'linear-gradient(180deg, #ECE9E1 0%, #FAF9F6 100%)',
      '--hero-aurora':
          'radial-gradient(ellipse at 32% 45%, rgba(99, 102, 241, 0.12) 0%, transparent 56%), '
          'radial-gradient(ellipse at 68% 40%, rgba(14, 165, 233, 0.09) 0%, transparent 54%), '
          'radial-gradient(ellipse at 50% 68%, rgba(217, 119, 6, 0.07) 0%, transparent 58%)',
      '--hero-title-gradient': 'linear-gradient(115deg, #141416 0%, #4F46E5 58%, #0284C7 100%)',
      '--featured-bg': 'linear-gradient(160deg, #FFFFFF 0%, #F5F3EE 100%)',
      '--featured-shadow': '0 4px 20px rgba(20, 20, 22, 0.06), inset 0 1px 0 rgba(255, 255, 255, 0.9)',
      '--link-blue': '#2563EB',
      '--link-blue-hover': '#1D4ED8',
      '--link-underline': 'rgba(37, 99, 235, 0.45)',
      '--link-underline-hover': 'rgba(29, 78, 216, 0.85)',
      '--hr-gradient': 'linear-gradient(90deg, transparent 0%, rgba(79, 70, 229, 0.35) 50%, transparent 100%)',
      '--selection-bg': 'rgba(79, 70, 229, 0.18)',
      '--selection-ink': '#141416',
      '--toggle-track': 'rgba(20, 20, 22, 0.05)',
      '--toggle-thumb': '#FFFFFF',
      '--toggle-thumb-shadow': '0 1px 3px rgba(20, 20, 22, 0.16)',
    },
  ),
  css('*, *::before, *::after').styles(
    raw: {
      'box-sizing': 'border-box',
    },
  ),
  css('html').styles(
    raw: {
      'scroll-behavior': 'smooth',
      '-webkit-font-smoothing': 'antialiased',
      '-moz-osx-font-smoothing': 'grayscale',
      'text-rendering': 'optimizeLegibility',
    },
  ),
  css('::view-transition-old(root), ::view-transition-new(root)').styles(
    raw: {
      'animation': 'none',
      'mix-blend-mode': 'normal',
    },
  ),
  css('html, body').styles(
    width: 100.percent,
    minHeight: 100.vh,
    padding: .zero,
    margin: .zero,
    fontFamily: fontSans,
    backgroundColor: bgCanvas,
    color: inkProse,
    raw: {
      'overflow-x': 'hidden',
    },
  ),
  css('::selection').styles(
    raw: {
      'background-color': 'var(--selection-bg)',
      'color': 'var(--selection-ink)',
    },
  ),
  css('h1, h2, h3, h4, h5, h6').styles(
    fontFamily: fontSans,
    color: inkPrimary,
    margin: .unset,
    fontWeight: FontWeight.w700,
  ),
  css('p').styles(
    margin: .unset,
  ),
  css('a').styles(
    color: inkPrimary,
    raw: {
      'transition': 'color 160ms ease, opacity 160ms ease, border-color 160ms ease, background-color 160ms ease',
    },
  ),
  css('img').styles(
    raw: {
      'max-width': '100%',
      'height': 'auto',
    },
  ),
];
