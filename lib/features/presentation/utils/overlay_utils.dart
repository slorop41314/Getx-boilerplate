import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:getx_boilerplate/features/presentation/utils/common.dart';

class OverlayUtils {
  static void showErrorSnackbar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  static void showLoading({String? message}) {
    Get.dialog(
      AlertDialog(
        content: Wrap(
          children: [
            LoadingIndicator(),
          ],
        ),
      ),
    );
  }

  static void showNotif({String? title, String? message}) {
    Get.snackbar(
      title ?? "",
      message ?? "",
      colorText: AppColors.primaryText,
      backgroundColor: Colors.white,
    );
  }

  static void closeLoading() {
    Get.back();
  }
}
