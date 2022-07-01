import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Rxn<Locale> currentLocale = Rxn<Locale>();

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  Future<void> initializeData() async {
    await Future.wait([
      getLatestDeviceLocale(),
    ]);
  }

  Future<void> getLatestDeviceLocale() async {
    try {
      currentLocale.value = Get.deviceLocale;
    } catch (err) {
      //
    }
  }
}
