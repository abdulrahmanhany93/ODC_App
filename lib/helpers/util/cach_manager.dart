import 'package:shared_preferences/shared_preferences.dart';

class CachManager {
  static SharedPreferences? sharedPref;
  static Future<void> initialize() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await sharedPref!.setString(key, value);
  }

  static String? getString(String key) {
    return sharedPref!.getString(key);
  }
}
