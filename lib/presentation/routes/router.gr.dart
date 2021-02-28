// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/highlights/highlight.dart';
import '../highlight/highlight_forms/highlight_form_page.dart';
import '../highlight/highlight_overview/highlight_overview_page.dart';
import '../sign_in/sign_in_page.dart';
import '../splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String signInPage = '/sign-in-page';
  static const String highlightOverviewPage = '/highlight-overview-page';
  static const String highlightFormPage = '/highlight-form-page';
  static const all = <String>{
    splashPage,
    signInPage,
    highlightOverviewPage,
    highlightFormPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.signInPage, page: SignInPage),
    RouteDef(Routes.highlightOverviewPage, page: HighlightOverviewPage),
    RouteDef(Routes.highlightFormPage, page: HighlightFormPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    SignInPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(),
        settings: data,
      );
    },
    HighlightOverviewPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HighlightOverviewPage(),
        settings: data,
      );
    },
    HighlightFormPage: (data) {
      final args = data.getArgs<HighlightFormPageArguments>(
        orElse: () => HighlightFormPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HighlightFormPage(
          key: args.key,
          editedHighlight: args.editedHighlight,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);

  Future<dynamic> pushSignInPage() => push<dynamic>(Routes.signInPage);

  Future<dynamic> pushHighlightOverviewPage() =>
      push<dynamic>(Routes.highlightOverviewPage);

  Future<dynamic> pushHighlightFormPage({
    Key key,
    Highlight editedHighlight,
  }) =>
      push<dynamic>(
        Routes.highlightFormPage,
        arguments: HighlightFormPageArguments(
            key: key, editedHighlight: editedHighlight),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HighlightFormPage arguments holder class
class HighlightFormPageArguments {
  final Key key;
  final Highlight editedHighlight;
  HighlightFormPageArguments({this.key, this.editedHighlight});
}
