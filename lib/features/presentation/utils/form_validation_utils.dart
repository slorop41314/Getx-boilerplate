import 'package:get/get.dart';

class FormValidationUtils {
  static String? isEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      print("EMAIL $email");
      return "Email cannot be empty";
    }
    if(!email.isEmail){
      return "Email is not valid";
    }
    return null;
  }
}
