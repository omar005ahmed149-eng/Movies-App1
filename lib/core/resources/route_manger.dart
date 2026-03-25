import 'package:flutter/cupertino.dart';
import 'package:movies/core/models/Movie_Model.dart';
import 'package:movies/features/Tabs/Browse/BrowseTab.dart';
import 'package:movies/features/Tabs/Home/HomeTab.dart';
import 'package:movies/features/Tabs/Profile/ProfileTab.dart';
import 'package:movies/features/Tabs/Search/SearchTab.dart';
import 'package:movies/features/auth/forget_pass/forget_pass_screen.dart';
import 'package:movies/features/auth/register/registerScreen.dart';
import 'package:movies/features/auth/login/login_screen.dart';
import 'package:movies/features/movie_details/movie_details_screen.dart';
import 'package:movies/features/onboarding/onboarding_screen.dart';
import '../../features/Tabs/MainLayoutPage/MainLayout.dart';
import '../../features/Update_Profile/Update_Profile.dart';

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
  static const String movieDetails = '/movieDetails';

  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case register:
        return CupertinoPageRoute(builder: (_) => Registerscreen());
      case login:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case forgetPassProfile:
        return CupertinoPageRoute(builder: (_) => ForgetPassScreen());
      case updateProfile:
        return CupertinoPageRoute(builder: (_) => const UpdateProfile());
      case mainlayout:
        return CupertinoPageRoute(builder: (_) => Mainlayout());
      case homescreen:
        return CupertinoPageRoute(builder: (_) => Hometab());
      case search:
        return CupertinoPageRoute(builder: (_) => Searchtab());
      case browse:
        return CupertinoPageRoute(builder: (_) => Browsetab());
      case profile:
        return CupertinoPageRoute(builder: (_) => const Profiletab());
      case onBoarding:
        return CupertinoPageRoute(builder: (_) => OnBoardingScreen());
      case movieDetails:
        final movie = settings.arguments as MovieModel;
        return CupertinoPageRoute(
            builder: (_) => MovieDetailsScreen(movie: movie));
      default:
        return null;
    }
  }
}
