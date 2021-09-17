import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:getx_boilerplate/features/domain/entities/user.dart';

class CommonController extends GetxController {
  static CommonController get find => Get.find();

  Rxn<User> currentUser = Rxn<User>();
  Rxn<Uint8List> userImage = Rxn<Uint8List>();

  Future<void> setCurrentUser(User currentUser) async {
    try {
      this.currentUser.value = currentUser;
      // this.userImage.value = base64Decode(base64.normalize(currentUser
      //     .profileImage!
      //     .split(',')
      //     .last
      //     .replaceAll("\n", "")
      //     .replaceAll(" ", "")));
    } catch (err) {
      print(err);
    }
  }
}
