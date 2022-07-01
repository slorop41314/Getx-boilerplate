import 'package:get/instance_manager.dart';
import 'package:getx_boilerplate/features/data/datasources/auth/auth_local_data_source.dart';
import 'package:getx_boilerplate/features/data/datasources/auth/auth_remote_data_source.dart';
import 'package:getx_boilerplate/features/data/repositories/auth_repository_impl.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:getx_boilerplate/features/domain/usecases/impl/auth/login_with_email_use_case_impl.dart';
import 'package:getx_boilerplate/features/domain/usecases/interface/auth/login_with_email_use_case.dart';

class AuthBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // DATA SOURCE
    Get.lazyPut<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
        secureStorage: Get.find(),
      ),
    );
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        apiProvider: Get.find(),
      ),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
        apiProvider: Get.find(),
      ),
    );

    // MARK: - USECASE
    Get.lazyPut<LoginWithEmailUseCase>(
      () => LoginWithEmailUseCaseImpl(
        authRepository: Get.find(),
      ),
    );
  }
}
