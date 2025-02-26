import 'package:online_exam_app/features/login/data/remote/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setRememberMe(bool rememberMe) {
    sharedPreferences.setBool("rememberMe", rememberMe);
  }

  static bool getRememberMe() {
    return sharedPreferences.getBool("rememberMe") ?? false;
  }

  static setToken(String token) {
    sharedPreferences.setString("token", token);
  }

  static String getToken() {
    return sharedPreferences.getString("token") ?? "";
  }

  static setUser(User user) {
    sharedPreferences.setString("_id", user.id ?? "");
    sharedPreferences.setString("username", user.username ?? "");
    sharedPreferences.setString("firstName", user.firstName ?? "");
    sharedPreferences.setString("lastName", user.lastName ?? "");
    sharedPreferences.setString("email", user.email ?? "");
    sharedPreferences.setString("phone", user.phone ?? "");
    sharedPreferences.setString("role", user.role ?? "");
    sharedPreferences.setBool("isVerified", user.isVerified ?? false);
    sharedPreferences.setString("createdAt", user.createdAt ?? "");
    sharedPreferences.setString(
        "passwordChangedAt", user.passwordChangedAt ?? "");
  }

  static User getUser() {
    return User(
      id: sharedPreferences.getString("_id") ?? "",
      username: sharedPreferences.getString("username") ?? "",
      firstName: sharedPreferences.getString("firstName") ?? "",
      lastName: sharedPreferences.getString("lastName") ?? "",
      email: sharedPreferences.getString("email") ?? "",
      phone: sharedPreferences.getString("phone") ?? "",
      role: sharedPreferences.getString("role") ?? "",
      isVerified: sharedPreferences.getBool("isVerified"),
      createdAt: sharedPreferences.getString("createdAt") ?? "",
      passwordChangedAt: sharedPreferences.getString("passwordChangedAt") ?? "",
    );
  }
}
