import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/profile/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        authRepository: Get.find(),
      ),
    );
  }
}
