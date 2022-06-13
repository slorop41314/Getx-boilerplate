import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  late FlutterSecureStorage sharedPreferences;

  static const String keyAccessToken = 'accessToken';
  static const String keyUserData = 'user_data';
  static const String keyRole = 'user_role';
  static const String keyFcmToken = 'fcm_token';

  SecureStorageManager({
    required this.sharedPreferences,
  });

  Future<void> putString(String key, String value) =>
      sharedPreferences.write(key: key, value: value);

  Future<String?> getString(String key) => sharedPreferences.read(key: key);

  Future<void> clearKey(String key) => sharedPreferences.delete(key: key);

  Future<void> clearAll() => sharedPreferences.deleteAll();
}
