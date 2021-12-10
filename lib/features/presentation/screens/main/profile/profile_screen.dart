import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:getx_boilerplate/features/presentation/screens/common/common_controller.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/change_password/change_password_screen.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/profile/profile_controller.dart';
import 'package:getx_boilerplate/features/presentation/utils/common.dart';

class ProfilePage extends GetView<ProfileController> {
  static const route_name = "/profile";
  ProfilePage({Key? key}) : super(key: key);

  final CommonController commonController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Profile"),
      body: ListView(
        children: [
          _buildTopProfile().sectionContainer(),
          SizedBox(
            height: 16,
          ),
          _buildMenuList().sectionContainer(),
        ],
      ),
    );
  }

  Column _buildMenuList() {
    return Column(
      children: [
        ListTile(
          title: Text("Profile details"),
          contentPadding: EdgeInsets.zero,
          onTap: () {
            // Get.toNamed(ProfileDetailPage.route_name);
          },
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          title: Text("Change password"),
          contentPadding: EdgeInsets.zero,
          onTap: () {
            Get.toNamed(ChangePasswordPage.route_name);
          },
          trailing: Icon(Icons.chevron_right),
        ),
        SizedBox(
          height: 12,
        ),
        CustomButton(
          label: "Log out",
          onPressed: () {},
          labelColor: AppColors.primary,
          buttonColor: Colors.white,
          height: 24,
          borderColor: AppColors.primary,
        )
      ],
    );
  }

  Widget _buildTopProfile() {
    return Obx(() {
      // final userProfile = commonController.profile.value;
      // if (userProfile == null) {
      //   return SizedBox();
      // }
      return Column(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.grey.shade300,
          ),
          SizedBox(
            height: 12,
          ),
          // Text(
          //   "${userProfile.firstName} ${userProfile.lastName}",
          //   style: CustomTextStyles.semibold16,
          // )

          Text(
            "User name",
            style: CustomTextStyles.semibold16,
          )
        ],
      );
    });
  }
}
