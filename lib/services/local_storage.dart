import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  static Future<bool> getSeenOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("seenOnBoarding") ?? false;
  }

  static Future<void> setSeenOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("seenOnBoarding", true);
  }
}