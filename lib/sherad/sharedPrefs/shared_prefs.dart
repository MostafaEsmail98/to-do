
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static String? getLang() {
    return prefs.getString("lang");
  }

  static setLang(String lang) async {
    await prefs.setString("lang", lang);
  }
  static String? getTheme () {
    return prefs.getString("Theme");
  }
  static setTheme(String Theme){
    prefs.setString("Theme", Theme);
  }
}
