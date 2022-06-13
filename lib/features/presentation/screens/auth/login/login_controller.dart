import 'package:get/get.dart';
import 'package:getx_boilerplate/features/domain/entities/user.dart';
import 'package:getx_boilerplate/features/domain/usecases/impl/auth/login_with_email_use_case_impl.dart';

class LoginController extends GetxController {
  final LoginWithEmailUseCase loginWithEmailUseCase;

  LoginController({
    required this.loginWithEmailUseCase,
  });

  var isLoadingLogin = false.obs;

  Future<User?> loginWithEmail(String email, String password) async {
    isLoadingLogin.value = true;
    final response = await this.loginWithEmailUseCase.execute(
          email,
          password,
        );

    // Set current user
    // CommonController.find.setCurrentUser(response!);

    isLoadingLogin.value = false;
    return response;
  }
}
