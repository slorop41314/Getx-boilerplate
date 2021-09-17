import 'package:getx_boilerplate/core/local/shared_pref.dart';

abstract class AuthLocalDataSource {
  Future<void> saveSessionData(dynamic json);
  Future<void> saveAuthToken(String token);
  Future<void> clearSessionData();
  dynamic getSessionData();
  String? getFcmToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferencesManager sharedPref;

  AuthLocalDataSourceImpl({required this.sharedPref});

  @override
  Future<void> saveSessionData(dynamic json) async {
    await this.sharedPref.putString(SharedPreferencesManager.keyUserData, json);
  }

  @override
  Future<void> saveAuthToken(String token) async {
    await this
        .sharedPref
        .putString(SharedPreferencesManager.keyAccessToken, token);
  }

  @override
  dynamic getSessionData() {
    return this.sharedPref.getString(SharedPreferencesManager.keyUserData);
  }

  @override
  Future<void> clearSessionData() async {
    await this.sharedPref.clearAll();
  }

  @override
  String? getFcmToken() {
    return this.sharedPref.getString(SharedPreferencesManager.keyFcmToken);
  }
}
