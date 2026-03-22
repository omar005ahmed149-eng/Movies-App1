import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/models/user_model.dart';
import 'package:movies/core/theme/theme_manger.dart';
import 'package:movies/core/resources/route_manger.dart';
import 'package:movies/firebase/firebase_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final OnBoarding = prefs.getBool('seenOnBoarding') ?? false;

  if(FirebaseAuth.instance.currentUser!=null){
    UserModel.currentUser= await FirebaseService.getUSerFromFIreStore(FirebaseAuth.instance.currentUser!.uid);
  }
  runApp(MoviesApp(seenOnboarding: OnBoarding,));
}

class MoviesApp extends StatelessWidget {
  final bool seenOnboarding;
  const MoviesApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: seenOnboarding == true
              ? FirebaseAuth.instance.currentUser == null
                  ? RoutesManger.login
                  : RoutesManger.mainlayout
              : RoutesManger.onBoarding,
          onGenerateRoute: RoutesManger.generateRoutes,
          darkTheme: ThemeManger().darkTheme,
          themeMode: ThemeMode.dark,
        );
      },
    );
  }

}
