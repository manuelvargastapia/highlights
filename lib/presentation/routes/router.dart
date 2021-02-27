import 'package:auto_route/auto_route_annotations.dart';

import 'package:highlights/presentation/sign_in/sign_in_page.dart';
import 'package:highlights/presentation/splash/splash_page.dart';
import 'package:highlights/presentation/highlight/highlight_overview/highlight_overview_page.dart';
import 'package:highlights/presentation/highlight/highlight_forms/highlight_form_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: HighlightOverviewPage),
    MaterialRoute(page: HighlightFormPage, fullscreenDialog: true),
  ],
)
class $Router {}
