import 'package:get/get.dart';
import 'package:getx_boilerplate/features/domain/entities/user.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';

class LoginController extends GetxController {
  late AuthRepository authRepository;

  LoginController({
    required this.authRepository,
  });

  var isLoadingLogin = false.obs;

  Future<User?> loginWithEmail(String email, String password) async {
    isLoadingLogin.value = true;
    final response = await this.authRepository.login(
          email,
          password,
        );

    // Set current user
    // CommonController.find.setCurrentUser(response!);

    isLoadingLogin.value = false;
    return response;
  }
}
