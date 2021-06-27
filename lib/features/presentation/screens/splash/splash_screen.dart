import 'dart:async';

import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:getx_boilerplate/features/presentation/components/widgets/app_logo.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/bottom_tab.dart';

class SplashScreen extends StatefulWidget {
  static const route_name = "/";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Get.offNamed(BottomTab.route_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            bottom: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              const AppLogo(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
