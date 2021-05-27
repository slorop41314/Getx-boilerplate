import 'package:getx_boilerplate/core/local/shared_pref.dart';

abstract class AuthLocalDataSource {
  Future<void> saveSessionData();
  dynamic getSessionData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferencesManager sharedPref;

  AuthLocalDataSourceImpl({required this.sharedPref});

  @override
  Future<void> saveSessionData() async {}

  @override
  dynamic getSessionData() {
    // final localAccessToken = this
    //     .sharedPreferencesManager
    //     .getString(SharedPreferencesManager.keyAccessToken);
    // final userRole = this
    //     .sharedPreferencesManager
    //     .getString(SharedPreferencesManager.keyRole);
    // if (localAccessToken != null && userRole != null) {
    //   apiProvider.accessToken = localAccessToken;
    //   return userRole;
    // }}
  }
}
