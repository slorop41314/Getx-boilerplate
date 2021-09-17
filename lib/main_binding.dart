import 'package:get/instance_manager.dart';
import 'package:getx_boilerplate/core/local/shared_pref.dart';
import 'package:getx_boilerplate/core/network/api_interceptor.dart';
import 'package:getx_boilerplate/core/network/api_provider.dart';
import 'package:getx_boilerplate/features/data/datasources/auth/auth_local_data_source.dart';
import 'package:getx_boilerplate/features/data/datasources/auth/auth_remote_data_source.dart';
import 'package:getx_boilerplate/features/data/repositories/auth_repository_impl.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Register all neccesary reuse class here
    // Its like injection container
    final sharedPref = await SharedPreferences.getInstance();
    Get.put(
      SharedPreferencesManager(sharedPreferences: sharedPref),
      permanent: true,
    );
    // API PROVIDER
    Get.put(
      ApiInterceptor(
        sharedPreferencesManager: Get.find(),
      ),
      permanent: true,
    );
    Get.put<ApiProvider>(
      ApiProviderImpl(
        Get.find(),
      ),
      permanent: true,
    );
    // DATA SOURCE
    Get.put<AuthLocalDataSource>(
      AuthLocalDataSourceImpl(
        sharedPref: Get.find(),
      ),
      permanent: true,
    );
    Get.put<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(
        apiProvider: Get.find(),
      ),
      permanent: true,
    );
    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
        apiProvider: Get.find(),
      ),
      permanent: true,
    );
  }
}
