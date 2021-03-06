import 'package:flutter/material.dart' hide Router;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import 'package:highlights/injection.dart';
import 'package:highlights/application/text_recognition/image_processer_bloc.dart';
import 'package:highlights/application/highlight/highlight_actor/highlight_actor_bloc.dart';
import 'package:highlights/application/authentication/auth_bloc.dart';
import 'package:highlights/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<HighlightActorBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ImageProcesserBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Highlights',
        // This is a temporary solution for auto_route issue
        // https://github.com/Milad-Akarie/auto_route_library/issues/257
        // TODO: wait for auto_route 1.0
        builder: ExtendedNavigator(router: Router()),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.cyan[800],
            accentColor: Colors.pinkAccent,
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blue[900],
            )),
      ),
    );
  }
}
