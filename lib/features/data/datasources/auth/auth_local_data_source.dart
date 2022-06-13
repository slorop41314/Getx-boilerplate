import 'package:getx_boilerplate/core/local/secure_storage.dart';
import 'package:getx_boilerplate/core/local/shared_pref.dart';

abstract class AuthLocalDataSource {
  Future<void> saveSessionData(dynamic json);
  Future<void> saveAuthToken(String token);
  Future<void> clearSessionData();
  Future<String?> getSessionData();
  Future<String?> getFcmToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageManager secureStorage;

  AuthLocalDataSourceImpl({
    required this.secureStorage,
  });

  @override
  Future<void> saveSessionData(dynamic json) async {
    await secureStorage.putString(
        SharedPreferencesManager.keyUserData, json as String);
  }

  @override
  Future<void> saveAuthToken(String token) async {
    await secureStorage.putString(
        SharedPreferencesManager.keyAccessToken, token);
  }

  @override
  Future<String?> getSessionData() {
    return secureStorage.getString(SharedPreferencesManager.keyUserData);
  }

  @override
  Future<void> clearSessionData() async {
    await secureStorage.clearAll();
  }

  @override
  Future<String?> getFcmToken() {
    return secureStorage.getString(SharedPreferencesManager.keyFcmToken);
  }
}
