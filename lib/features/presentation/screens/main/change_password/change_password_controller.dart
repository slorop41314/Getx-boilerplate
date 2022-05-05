import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:getx_boilerplate/features/domain/entities/request/change_password_request.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:getx_boilerplate/features/presentation/utils/overlay_utils.dart';

class ChangePasswordController extends GetxController {
  final AuthRepository repository;

  ChangePasswordController({required this.repository});

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  List<TextEditingController> disposables = [];

  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    disposables = [
      currentPasswordController,
      newPasswordController,
      confirmPasswordController,
    ];
    super.onInit();
  }

  @override
  void onClose() {
    disposables.forEach((element) {
      element.dispose();
    });
    super.onClose();
  }

  Future<void> onSubmit() async {
    isLoading(true);

    try {
      await repository.changePassword(
        ChangePasswordRequest(
          currentPassword: currentPasswordController.text,
          password: newPasswordController.text,
          confirmPassword: confirmPasswordController.text,
        ),
      );
      Get.back();
      OverlayUtils.showNotif(
        title: "Success",
        message: "Change password success",
      );
    } catch (err) {
      var message = "Change password error";
      if (err is Dio.Response) {
        message = err.data["message"];
        final errorList = err.data['errors'];
        if (errorList != null && errorList is Map<String, dynamic>) {
          errorList.forEach((key, value) {
            message += "\n${value.first}";
          });
        }
      }
      OverlayUtils.showErrorSnackbar(message);
      print(err);
    }

    isLoading(false);
  }
}
