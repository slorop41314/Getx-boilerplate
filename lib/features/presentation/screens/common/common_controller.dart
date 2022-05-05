import 'package:get/get.dart';
import 'package:getx_boilerplate/features/domain/entities/user.dart';

class CommonController extends GetxController {
  static CommonController get find => Get.find();

  Rxn<User> _currentUser = Rxn<User>();
  User? get currentUser => _currentUser.value;
  set currentUser(User? user) {
    _currentUser.value = user;
  }

  Future<void> setCurrentUser(User currentUser) async {
    try {
      this._currentUser.value = currentUser;
    } catch (err) {
      print(err);
    }
  }
}
