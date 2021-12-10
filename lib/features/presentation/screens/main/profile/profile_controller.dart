import 'package:get/get.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_screen.dart';

class ProfileController extends GetxController {
  final AuthRepository authRepository;

  ProfileController({
    required this.authRepository,
  });

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onPressLogout() async {
    this.authRepository.logout();

    Get.offAllNamed(LoginScreen.route_name);
  }
}
