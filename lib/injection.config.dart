// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_ml_vision/firebase_ml_vision.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

import 'application/authentication/auth_bloc.dart' as _i17;
import 'application/authentication/sign_in_form/sign_in_form_bloc.dart' as _i16;
import 'application/highlight/highlight_actor/highlight_actor_bloc.dart'
    as _i18;
import 'application/highlight/highlight_filterer/highlight_filterer_bloc.dart'
    as _i9;
import 'application/highlight/highlight_form/highlight_form_bloc.dart' as _i19;
import 'application/highlight/highlight_watcher/highlight_watcher_bloc.dart'
    as _i20;
import 'domain/authentication/i_auth_facade.dart' as _i10;
import 'domain/highlights/i__text_recognition_repostitory.dart' as _i14;
import 'domain/highlights/i_highlight_repository.dart' as _i12;
import 'infrastructure/authentication/auth_provider_manager.dart' as _i3;
import 'infrastructure/authentication/firebase_auth_facade.dart' as _i11;
import 'infrastructure/core/firebase_injectable_module.dart' as _i21;
import 'infrastructure/highlight/highlight_repository.dart' as _i13;
import 'infrastructure/highlight/text_recognition_repository.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.AuthProviderManager>(() => _i3.AuthProviderManager());
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i6.FirebaseStorage>(() => firebaseInjectableModule.storage);
  gh.lazySingleton<_i7.FirebaseVision>(() => firebaseInjectableModule.vision);
  gh.lazySingleton<_i8.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.factory<_i9.HighlightFiltererBloc>(() => _i9.HighlightFiltererBloc());
  gh.lazySingleton<_i10.IAuthFacade>(() => _i11.FirebaseAuthFacade(
      get<_i4.FirebaseAuth>(),
      get<_i8.GoogleSignIn>(),
      get<_i3.AuthProviderManager>()));
  gh.lazySingleton<_i12.IHighlightRepository>(() => _i13.HighlightRepository(
      get<_i5.FirebaseFirestore>(),
      get<_i6.FirebaseStorage>(),
      get<_i10.IAuthFacade>()));
  gh.lazySingleton<_i14.ITextRecognitionRepository>(
      () => _i15.TextRecognitionRepository(get<_i7.FirebaseVision>()));
  gh.factory<_i16.SignInFormBloc>(
      () => _i16.SignInFormBloc(get<_i10.IAuthFacade>()));
  gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(get<_i10.IAuthFacade>()));
  gh.factory<_i18.HighlightActorBloc>(
      () => _i18.HighlightActorBloc(get<_i12.IHighlightRepository>()));
  gh.factory<_i19.HighlightFormBloc>(() => _i19.HighlightFormBloc(
      get<_i12.IHighlightRepository>(),
      get<_i14.ITextRecognitionRepository>()));
  gh.factory<_i20.HighlightWatcherBloc>(
      () => _i20.HighlightWatcherBloc(get<_i12.IHighlightRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends _i21.FirebaseInjectableModule {}
