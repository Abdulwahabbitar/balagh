import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../core/utils/theme/theme_data/theme_light_data.dart';
import '../authentication/di/dependency_injection.dart';
import '../authentication/presentation/view/login_screen.dart';
import '../authentication/presentation/view/register_screen.dart';
import '../authentication/presentation/viewmodel/bloc/authentication_bloc.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthenticationBloc>(),
        ),
        // BlocProvider(
        //   create: (context) => getIt<TaskBloc>(),
        // ),
      ],

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeLightData(),
          locale: const Locale('ar', ''),
      supportedLocales: const [
        Locale('ar', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
          initialRoute: LoginScreen.route,
          routes: {
            LoginScreen.route: (context) => LoginScreen(),
            RegisterScreen.route: (context) => RegisterScreen(),

          },
        ),

    );
  }
}
