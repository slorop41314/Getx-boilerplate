import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/bottom_tab.dart';

class LoginController extends GetxController {
  late AuthRepository authRepository;

  LoginController({
    required this.authRepository,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  var isLoadingLogin = false.obs;

  void loginWithEmail() async {
    isLoadingLogin.value = true;
    try {
      final response = await this.authRepository.login(
            emailController.text,
            passwordController.text,
          );

      // Set current user
      // CommonController.find.setCurrentUser(response!);

      // Navigate to main screen
      Get.offNamed(
        BottomTab.route_name,
      );

      isLoadingLogin.value = false;
    } catch (error) {
      var message = "Login error, please try again";
      if (error is Dio.Response) {
        message = error.data["message"];
      }
      Get.showSnackbar(
        GetBar(
          message: message,
          duration: Duration(seconds: 1),
        ),
      );
      print(error);
    }
    isLoadingLogin.value = false;
  }
}
