// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:blog/components/footer.dart' as _footer;
import 'package:blog/components/header.dart' as _header;
import 'package:blog/constants/theme.dart' as _theme;
import 'package:blog/pages/about.dart' as _about;
import 'package:blog/pages/home.dart' as _home;
import 'package:blog/pages/post_page.dart' as _post_page;
import 'package:blog/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  styles: () => [
    ..._theme.styles,
    ..._app.App.styles,
    ..._footer.Footer.styles,
    ..._header.Header.styles,
    ..._about.About.styles,
    ..._home.Home.styles,
    ..._post_page.PostPage.styles,
  ],
);
