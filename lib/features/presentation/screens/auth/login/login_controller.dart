import 'package:dio/dio.dart' as Dio;
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
    try {
      final response = await this.authRepository.login(
            email,
            password,
          );

      // Set current user
      // CommonController.find.setCurrentUser(response!);

      isLoadingLogin.value = false;
      return response;
    } catch (error) {
      print(error);
      var message = "Login error, please try again";
      if (error is Dio.Response) {
        message = error.data["message"];
      }
      isLoadingLogin.value = false;
      return Future.error(message);
    }
  }
}
