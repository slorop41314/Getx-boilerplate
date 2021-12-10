import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/change_password/change_password_controller.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(
        repository: Get.find(),
      ),
    );
  }
}
