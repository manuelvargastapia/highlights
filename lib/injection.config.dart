// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'application/authentication/auth_bloc.dart';
import 'infrastructure/authentication/auth_provider_manager.dart';
import 'infrastructure/authentication/firebase_auth_facade.dart';
import 'infrastructure/core/firebase_injectable_module.dart';
import 'application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'application/highlight/highlight_form/highlight_form_bloc.dart';
import 'infrastructure/highlight/highlight_repository.dart';
import 'application/highlight/highlight_watcher/highlight_watcher_bloc.dart';
import 'domain/authentication/i_auth_facade.dart';
import 'domain/highlights/i_highlight_repository.dart';
import 'application/authentication/sign_in_form/sign_in_form_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<AuthProviderManager>(() => AuthProviderManager());
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        get<FirebaseAuth>(),
        get<GoogleSignIn>(),
        get<AuthProviderManager>(),
      ));
  gh.lazySingleton<IHighlightRepository>(
      () => HighlightRepository(get<FirebaseFirestore>()));
  gh.factory<SignInFormBloc>(() => SignInFormBloc(get<IAuthFacade>()));
  gh.factory<AuthBloc>(() => AuthBloc(get<IAuthFacade>()));
  gh.factory<HighlightActorBloc>(
      () => HighlightActorBloc(get<IHighlightRepository>()));
  gh.factory<HighlightFormBloc>(
      () => HighlightFormBloc(get<IHighlightRepository>()));
  gh.factory<HighlightWatcherBloc>(
      () => HighlightWatcherBloc(get<IHighlightRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
