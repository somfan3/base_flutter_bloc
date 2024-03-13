import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  accessToken,
  refreshToken,
}

class LocalStorage {
  LocalStorage._();

  static final LocalStorage instance = LocalStorage._();

  factory LocalStorage() => instance;

  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String get accessToken => prefs?.getString(_Key.accessToken.name) ?? "";

  set accessToken(String accessToken) =>
      prefs?.setString(_Key.accessToken.name, accessToken);

  String get refreshToken => prefs?.getString(_Key.refreshToken.name) ?? "";

  set refreshToken(String refreshToken) =>
      prefs?.setString(_Key.refreshToken.name, refreshToken);
}
