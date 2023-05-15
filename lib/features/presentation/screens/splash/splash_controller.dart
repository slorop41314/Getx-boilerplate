import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_screen.dart';
import 'package:getx_boilerplate/features/presentation/screens/common/common_controller.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/bottom_tab.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {
  late AuthRepository authRepository;

  SplashController({required this.authRepository});

  Rxn<PackageInfo> appInfo = Rxn<PackageInfo>();

  @override
  void onInit() {
    super.onInit();
    _getPackageInfo();
    Timer(
      const Duration(seconds: 2),
      () {
        _checkAndNavigateUser();
      },
    );
  }

  void _checkAndNavigateUser() async {
    final user = await this.authRepository.getLoggedInUserData();
    if (user != null) {
      await CommonController.find.setCurrentUser(user);
      Get.offAllNamed(BottomTab.route_name);
    } else {
      Get.offAllNamed(LoginScreen.route_name);
    }
    // Get.put(PushNotificationService(
    //   sharedPref: Get.find(),
    // ));
  }

  void _getPackageInfo() async {
    final res = await PackageInfo.fromPlatform();
    appInfo.value = res;
  }
}
