// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'application/authentication/auth_bloc.dart' as _i13;
import 'application/authentication/sign_in_form/sign_in_form_bloc.dart' as _i12;
import 'application/highlight/highlight_actor/highlight_actor_bloc.dart'
    as _i14;
import 'application/highlight/highlight_filterer/highlight_filterer_bloc.dart'
    as _i7;
import 'application/highlight/highlight_form/highlight_form_bloc.dart' as _i15;
import 'application/highlight/highlight_watcher/highlight_watcher_bloc.dart'
    as _i16;
import 'domain/authentication/i_auth_facade.dart' as _i8;
import 'domain/highlights/i_highlight_repository.dart' as _i10;
import 'infrastructure/authentication/auth_provider_manager.dart' as _i3;
import 'infrastructure/authentication/firebase_auth_facade.dart' as _i9;
import 'infrastructure/core/firebase_injectable_module.dart' as _i17;
import 'infrastructure/highlight/highlight_repository.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i6.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.factory<_i7.HighlightFiltererBloc>(() => _i7.HighlightFiltererBloc());
  gh.lazySingleton<_i8.IAuthFacade>(() => _i9.FirebaseAuthFacade(
      get<_i4.FirebaseAuth>(),
      get<_i6.GoogleSignIn>(),
      get<_i3.AuthProviderManager>()));
  gh.lazySingleton<_i10.IHighlightRepository>(() => _i11.HighlightRepository(
      get<_i5.FirebaseFirestore>(), get<_i8.IAuthFacade>()));
  gh.factory<_i12.SignInFormBloc>(
      () => _i12.SignInFormBloc(get<_i8.IAuthFacade>()));
  gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(get<_i8.IAuthFacade>()));
  gh.factory<_i14.HighlightActorBloc>(
      () => _i14.HighlightActorBloc(get<_i10.IHighlightRepository>()));
  gh.factory<_i15.HighlightFormBloc>(
      () => _i15.HighlightFormBloc(get<_i10.IHighlightRepository>()));
  gh.factory<_i16.HighlightWatcherBloc>(
      () => _i16.HighlightWatcherBloc(get<_i10.IHighlightRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends _i17.FirebaseInjectableModule {}
