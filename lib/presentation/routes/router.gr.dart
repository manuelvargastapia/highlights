// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../application/highlight/highlight_form/highlight_form_bloc.dart';
import '../../domain/highlights/highlight.dart';
import '../highlight/highlight_forms/core/image_presentation_class.dart';
import '../highlight/highlight_forms/highlight_form_page.dart';
import '../highlight/highlight_overview/highlight_overview_page.dart';
import '../sign_in/sign_in_page.dart';
import '../splash/splash_page.dart';
import '../text_recognition/text_recognition_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String signInPage = '/sign-in-page';
  static const String highlightOverviewPage = '/highlight-overview-page';
  static const String highlightFormPage = '/highlight-form-page';
  static const String textRecognitionPage = '/text-recognition-page';
  static const all = <String>{
    splashPage,
    signInPage,
    highlightOverviewPage,
    highlightFormPage,
    textRecognitionPage,
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
    RouteDef(Routes.textRecognitionPage, page: TextRecognitionPage),
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
    TextRecognitionPage: (data) {
      final args = data.getArgs<TextRecognitionPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => TextRecognitionPage(
          originalImage: args.originalImage,
          croppedImage: args.croppedImage,
          formBloc: args.formBloc,
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

  Future<dynamic> pushTextRecognitionPage({
    @required ImagePrimitive originalImage,
    @required ImagePrimitive croppedImage,
    @required HighlightFormBloc formBloc,
  }) =>
      push<dynamic>(
        Routes.textRecognitionPage,
        arguments: TextRecognitionPageArguments(
            originalImage: originalImage,
            croppedImage: croppedImage,
            formBloc: formBloc),
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

/// TextRecognitionPage arguments holder class
class TextRecognitionPageArguments {
  final ImagePrimitive originalImage;
  final ImagePrimitive croppedImage;
  final HighlightFormBloc formBloc;
  TextRecognitionPageArguments(
      {@required this.originalImage,
      @required this.croppedImage,
      @required this.formBloc});
}
