
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/components/widgets/app_logo.dart';
import 'package:getx_boilerplate/features/presentation/screens/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  static const route_name = "/";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController _controller = Get.find();

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
