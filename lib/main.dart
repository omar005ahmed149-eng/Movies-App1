import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/bloc/auth/auth_cubit.dart';
import 'package:movies/core/bloc/auth/auth_state.dart';
import 'package:movies/core/bloc/movies/movies_cubit.dart';
import 'package:movies/core/theme/theme_manger.dart';
import 'package:movies/core/resources/route_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final OnBoarding = prefs.getBool('seenOnBoarding') ?? false;
  final moviesCubit = MoviesCubit();
  final authCubit = AuthCubit(moviesCubit);
  await authCubit.bootstrapSession();

  runApp(MoviesApp(
    seenOnboarding: OnBoarding,
    hasValidSession: authCubit.state.status == AuthStatus.authenticated,
    moviesCubit: moviesCubit,
    authCubit: authCubit,
  ));
}

class MoviesApp extends StatelessWidget {
  final bool seenOnboarding;
  final bool hasValidSession;
  final MoviesCubit moviesCubit;
  final AuthCubit authCubit;
  const MoviesApp({
    super.key,
    required this.seenOnboarding,
    required this.hasValidSession,
    required this.moviesCubit,
    required this.authCubit,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: moviesCubit),
        BlocProvider.value(value: authCubit),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(430, 932),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: seenOnboarding == true
                ? (hasValidSession
                    ? RoutesManger.mainlayout
                    : RoutesManger.login)
                : RoutesManger.onBoarding,
            onGenerateRoute: RoutesManger.generateRoutes,
            darkTheme: ThemeManger().darkTheme,
            themeMode: ThemeMode.dark,
          );
        },
      ),
    );
  }
}
