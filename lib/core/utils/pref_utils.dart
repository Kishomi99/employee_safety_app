import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setLogged(bool value) async {
    await _prefs?.setBool('logged', value);
  }

  static Future<void> setToken(String value) async {
    await _prefs!.setString('token', value);
  }

  static String getToken() {
    return _prefs!.getString('token') ?? '';
  }
}
