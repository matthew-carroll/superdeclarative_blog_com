/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'dart:io';
import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';
import 'package:blog/models/post_compiler.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  // Automatically compile posts on server startup (comparison check prevents endless loops!)
  compilePosts();

  // Watch content directory for changes in the background (dev mode auto-compilation!)
  _startContentWatcher();

  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(Document(
    title: 'SuperDeclarative Blog',
    head: [
      link(
        rel: 'apple-touch-icon',
        href: '/images/favicon/apple-touch-icon.png',
        attributes: const {'sizes': '180x180'},
      ),
      link(
        rel: 'icon',
        type: 'image/png',
        href: '/images/favicon/favicon-32x32.png',
        attributes: const {'sizes': '32x32'},
      ),
      link(
        rel: 'icon',
        type: 'image/png',
        href: '/images/favicon/favicon-16x16.png',
        attributes: const {'sizes': '16x16'},
      ),
      link(rel: 'manifest', href: '/images/favicon/site.webmanifest'),
      link(
        rel: 'mask-icon',
        href: '/images/favicon/safari-pinned-tab.svg',
        attributes: const {'color': '#5bbad5'},
      ),
      link(rel: 'shortcut icon', href: '/images/favicon/favicon.ico'),
      meta(name: 'msapplication-TileColor', content: '#07080D'),
      meta(name: 'msapplication-config', content: '/images/favicon/browserconfig.xml'),
      meta(name: 'theme-color', content: '#FAF9F6'),
      link(
        rel: 'preconnect',
        href: 'https://fonts.googleapis.com',
      ),
      link(
        rel: 'preconnect',
        href: 'https://fonts.gstatic.com',
        attributes: const {'crossorigin': ''},
      ),
      link(
        rel: 'stylesheet',
        href:
            'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500&family=Source+Serif+4:ital,opsz,wght@0,8..60,400;0,8..60,500;0,8..60,600;1,8..60,400;1,8..60,500;1,8..60,600&display=swap',
      ),
      script(
        content: '''
(function() {
  // The visitor chooses light, dark or system, and system is the default. System
  // falls back to light when there isn't a system preference.
  var systemDark = window.matchMedia ? window.matchMedia('(prefers-color-scheme: dark)') : null;
  var choice = null;
  try { choice = localStorage.getItem('sd-theme'); } catch (e) {}
  if (choice !== 'light' && choice !== 'dark') choice = 'system';

  function resolveTheme() {
    if (choice !== 'system') return choice;
    return systemDark && systemDark.matches ? 'dark' : 'light';
  }
  function syncToggle() {
    var input = document.querySelector('#theme-toggle input[value="' + choice + '"]');
    if (input) input.checked = true;
  }
  function applyTheme() {
    var root = document.documentElement;
    var meta = document.querySelector('meta[name="theme-color"]');
    root.setAttribute('data-theme-choice', choice);
    if (resolveTheme() === 'light') {
      root.setAttribute('data-theme', 'light');
      if (meta) meta.setAttribute('content', '#FAF9F6');
    } else {
      root.removeAttribute('data-theme');
      if (meta) meta.setAttribute('content', '#141416');
    }
  }

  applyTheme();
  document.addEventListener('DOMContentLoaded', syncToggle);

  // Follow changes to the system preference.
  if (systemDark && systemDark.addEventListener) {
    systemDark.addEventListener('change', applyTheme);
  }

  // While a theme change is animating, the browser sends every click to the root
  // element. Find the option that was clicked, so that the toggle still responds.
  document.addEventListener('click', function(e) {
    if (e.target !== document.documentElement) return;
    document.querySelectorAll('.theme-option').forEach(function(option) {
      var rect = option.getBoundingClientRect();
      if (e.clientX >= rect.left && e.clientX < rect.right && e.clientY >= rect.top && e.clientY < rect.bottom) {
        option.querySelector('input').click();
      }
    });
  });

  var transition = null;
  var reveal = null;

  document.addEventListener('change', function(e) {
    var option = e.target && e.target.closest ? e.target.closest('.theme-option') : null;
    if (!option) return;
    var previousTheme = resolveTheme();
    choice = e.target.value;
    try {
      if (choice === 'system') localStorage.removeItem('sd-theme');
      else localStorage.setItem('sd-theme', choice);
    } catch (err) {}

    // Never start a transition on top of another one, because that crashes Chrome.
    // Instead, cut the running animation short and switch instantly.
    if (transition) {
      if (reveal) reveal.cancel();
      transition.skipTransition();
      applyTheme();
      return;
    }

    // Moving between, for example, light and a light system doesn't change the page.
    if (resolveTheme() === previousTheme) {
      applyTheme();
      return;
    }

    var reduceMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    if (!document.startViewTransition || reduceMotion) {
      applyTheme();
      return;
    }

    var rect = option.getBoundingClientRect();
    var x = rect.left + rect.width / 2;
    var y = rect.top + rect.height / 2;
    var endRadius = Math.hypot(
      Math.max(x, window.innerWidth - x),
      Math.max(y, window.innerHeight - y)
    );

    transition = document.startViewTransition(function() {
      applyTheme();
    });

    transition.ready.then(function() {
      reveal = document.documentElement.animate(
        {
          clipPath: [
            'circle(0px at ' + x + 'px ' + y + 'px)',
            'circle(' + endRadius + 'px at ' + x + 'px ' + y + 'px)'
          ]
        },
        {
          duration: 1000,
          easing: 'cubic-bezier(0.22, 1, 0.36, 1)',
          pseudoElement: '::view-transition-new(root)'
        }
      );
    }).catch(function() {
      // The transition was skipped.
    });

    function onFinished() {
      transition = null;
      reveal = null;
    }
    transition.finished.then(onFinished, onFinished);
  });
})();
''',
      ),
    ],
    body: Component.fragment([
      // Light is the default until the theme script, above, picks a theme.
      const Document.html(attributes: {'data-theme': 'light', 'data-theme-choice': 'system'}),
      App(),
    ]),
  ));
}

void _startContentWatcher() {
  final contentDir = Directory('content');
  if (contentDir.existsSync()) {
    contentDir.watch(recursive: true).listen((event) {
      if (event.path.endsWith('.md')) {
        try {
          compilePosts();
        } catch (_) {
          // Prevent server crashes from incomplete file writes
        }
      }
    });
  }
}
