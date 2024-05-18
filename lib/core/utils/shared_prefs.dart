import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? sharedPreferences;
  static initSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveToken(String token) async {
    sharedPreferences!.setString("token", token);
  }

  static String? getToken() {
    return sharedPreferences!.getString('token');
  }

  static void saveIsFirstTime() async {
    sharedPreferences!.setBool("isFirstTime", true);
  }

  static bool? getIsFirstTime() {
    return sharedPreferences!.getBool("isFirstTime");
  }
}
