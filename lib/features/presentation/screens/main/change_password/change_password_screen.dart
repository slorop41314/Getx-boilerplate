import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/change_password/change_password_controller.dart';
import 'package:getx_boilerplate/features/presentation/utils/common.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  static const route_name = "/profile/change-password";
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Change Password"),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Create New Password",
            style: CustomTextStyles.bold18,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Enter a new password for your account. We highly recommended you create a unique password ",
            style: CustomTextStyles.regular14.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              CustomInput(
                label: "Current password",
                secureText: true,
                controller: controller.currentPasswordController,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomInput(
                label: "New password",
                secureText: true,
                controller: controller.newPasswordController,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomInput(
                label: "Confirm new password",
                secureText: true,
                controller: controller.confirmPasswordController,
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => CustomButton(
          isLoading: controller.isLoading.value,
          label: "Save",
          onPressed: controller.onSubmit,
        ).bottomActionContainer(),
      ),
    );
  }
}
