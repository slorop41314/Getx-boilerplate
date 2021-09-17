import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:getx_boilerplate/features/presentation/components/widgets/app_logo.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const route_name = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.find();

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
      child: Column(
        children: [
          CustomInput(
            label: "Email",
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
            onPressed: _controller.loginWithEmail,
          )
        ],
      ),
    );
  }
}
