import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => LoginController(
        authRepository: Get.find(),
      ),
    );
  }
}
