import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_boilerplate/binding/auth_binding.dart';
import 'package:getx_boilerplate/core/local/local_db.dart';
import 'package:getx_boilerplate/core/local/secure_storage.dart';
import 'package:getx_boilerplate/core/local/shared_pref.dart';
import 'package:getx_boilerplate/core/network/api_interceptor.dart';
import 'package:getx_boilerplate/core/network/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Register all neccesary reuse class here
    final sharedPref = await SharedPreferences.getInstance();
    final secureStorage = FlutterSecureStorage();
    Get.put(
      LocalDatabase(),
      permanent: true,
    );
    Get.put(
      SharedPreferencesManager(sharedPreferences: sharedPref),
      permanent: true,
    );
    Get.put(
      SecureStorageManager(sharedPreferences: secureStorage),
      permanent: true,
    );
    // API PROVIDER
    Get.put(
      ApiInterceptor(
        sharedPreferencesManager: Get.find(),
      ),
      permanent: true,
    );
    Get.lazyPut<ApiProvider>(
      () => ApiProviderImpl(
        Get.find(),
      ),
    );
    await AuthBinding().dependencies();
  }
}
