// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/core/lang/lang_config.dart';
import 'package:getx_boilerplate/features/presentation/routes/app_routes.dart';
import 'package:getx_boilerplate/features/presentation/utils/app_theme.dart';
import 'package:getx_boilerplate/main_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainBinding().dependencies();
  runApp(App());
}

class App extends StatelessWidget {
  // FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme(),
      navigatorObservers: [
        // FirebaseAnalyticsObserver(analytics: analytics),
      ],
      translations: LangConfig(),
      locale: Get.deviceLocale,
      fallbackLocale: LangConfig.fallbackLocale,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.pages(),
    );
  }
}
