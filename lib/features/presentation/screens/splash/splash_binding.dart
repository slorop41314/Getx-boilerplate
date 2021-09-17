import 'package:get/instance_manager.dart';
import 'package:getx_boilerplate/features/presentation/screens/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SplashController(
        authRepository: Get.find(),
      ),
    );
  }
}
