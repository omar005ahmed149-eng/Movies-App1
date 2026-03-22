import 'package:flutter/cupertino.dart';
import 'package:movies/features/Tabs/Browse/BrowseTab.dart';
import 'package:movies/features/Tabs/Home/HomeTab.dart';
import 'package:movies/features/Tabs/Profile/ProfileTab.dart';
import 'package:movies/features/Tabs/Search/SearchTab.dart';
import 'package:movies/features/auth/forget_pass/forget_pass_screen.dart';
import 'package:movies/features/auth/login/login_screen.dart';
import 'package:movies/features/auth/register/registerScreen.dart';
import 'package:movies/features/onboarding/onboarding_screen.dart';
import '../../features/Tabs/MainLayoutPage/MainLayout.dart';
import '../../features/Tabs/Profile/Update_Profile/Update_Profile.dart';

abstract class RoutesManger {
  static const String login = '/login';
  static const String register = '/register';
  static const String updateProfile = '/updateProfile';
  static const String forgetPassProfile = '/forgetPassProfile';
  static const String mainlayout = '/mainlayout';
  static const String homescreen = '/homeScreen';
  static const String search = '/search';
  static const String browse = '/browse';
  static const String profile = '/profile';
  static const String onBoarding = '/onBoarding';

  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case register:
        {
          return CupertinoPageRoute(builder: (context) => Registerscreen());
        }
      case login:
        {
          return CupertinoPageRoute(builder: (context) => LoginScreen());
        }
      case forgetPassProfile:
        {
          return CupertinoPageRoute(builder: (context) => ForgetPassScreen());
        }
      case updateProfile:
        {
          return CupertinoPageRoute(builder: (context) => UpdateProfile());
        }
      case mainlayout:
        {
          return CupertinoPageRoute(builder: (context) => Mainlayout());
        }
      case homescreen:
        {
          return CupertinoPageRoute(builder: (context) => Hometab());
        }
      case search:
        {
          return CupertinoPageRoute(builder: (context) => Searchtab());
        }
      case browse:
        {
          return CupertinoPageRoute(builder: (context) => Browsetab());
        }
      case profile:
        {
          return CupertinoPageRoute(builder: (context) => Profiletab());
        } case onBoarding:
        {
          return CupertinoPageRoute(builder: (context) => OnBoardingScreen());
        }
    }
  }
}
