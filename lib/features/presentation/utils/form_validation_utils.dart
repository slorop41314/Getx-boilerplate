import 'package:get/get.dart';

class FormValidationUtils {
  static String? isEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return "Email cannot be empty";
    }
    if (!email.isEmail) {
      return "Email is not valid";
    }
    return null;
  }

  static String? isNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  static String? isPassword(String? value) {
    if (value == null || value.trim().isEmpty || value.length < 8) {
      return "Minimum password length is 8";
    }
    return null;
  }

  static String? isSamePassword(String? password, String? confirmPassword) {
    if (password?.length != confirmPassword?.length) {
      return "Password and confirm password are not equal";
    }
    return null;
  }
}
