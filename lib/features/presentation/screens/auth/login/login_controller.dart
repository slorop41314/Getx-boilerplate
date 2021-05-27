import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';

class LoginController extends GetxController {
  late AuthRepository authRepository;

  LoginController({
    required this.authRepository,
  });

  var isLoadingLogin = false.obs;

  void loginWithEmail() async {
    isLoadingLogin.value = true;
    try {
      // final response = await this.authRepository.login();
      isLoadingLogin.value = false;
    } catch (error) {
      isLoadingLogin.value = false;
    }
  }
}
