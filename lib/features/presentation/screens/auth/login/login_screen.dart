import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:getx_boilerplate/features/presentation/components/widgets/app_logo.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_controller.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/bottom_tab.dart';
import 'package:getx_boilerplate/features/presentation/utils/form_validation_utils.dart';

class LoginScreen extends StatefulWidget {
  static const route_name = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.find();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _buildTopButton(),
                      SizedBox(
                        height: 12,
                      ),
                      const AppLogo(),
                      _buildForm(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTopButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.help),
          label: Text("Help"),
        ),
      ],
    );
  }

  Form _buildForm() {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          CustomInput(
            label: "Email",
            controller: emailController,
            validator: FormValidationUtils.isEmail,
          ),
          SizedBox(
            height: 12,
          ),
          CustomInput(
            label: "Password",
            secureText: true,
          ),
          SizedBox(
            height: 24,
          ),
          CustomButton(
            label: "LOGIN",
            onPressed: () {
              if (loginFormKey.currentState?.validate() ?? false) {
                loginFormKey.currentState?.save();
                onLoginWithEmail();
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> onLoginWithEmail() async {
    try {
      final res = await _controller.loginWithEmail(
        emailController.text,
        passwordController.text,
      );
      if (res != null) {
        // Navigate to main screen
        Get.offNamed(
          BottomTab.route_name,
        );
      }
    } catch (err) {
      print(err);
      Get.showSnackbar(
        GetBar(
          message: err as String,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}
