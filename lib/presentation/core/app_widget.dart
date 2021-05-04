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
          primaryColor: const Color(0xff80bee0),
          accentColor: const Color(0xffd5baf8),
          scaffoldBackgroundColor: const Color(0xffeeeeee),
          appBarTheme: const AppBarTheme(elevation: 0),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          cardTheme: CardTheme(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xff80bee0),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                const Color(0xff80bee0),
              ),
            ),
          ),
          backgroundColor: const Color(0xff909090),
          errorColor: Colors.red.withOpacity(0.8),
        ),
      ),
    );
  }
}
