// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/app_controller.dart';
import 'package:getx_boilerplate/features/presentation/routes/app_routes.dart';
import 'package:getx_boilerplate/features/presentation/utils/app_theme.dart';
import 'package:getx_boilerplate/binding/main_binding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainBinding().dependencies();
  runApp(App());
}

class App extends StatelessWidget {
  // FirebaseAnalytics analytics = FirebaseAnalytics();

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        theme: appTheme(),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
        ],
        navigatorObservers: [
          // FirebaseAnalyticsObserver(analytics: analytics),
        ],
        locale: appController.currentLocale.value,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initial,
        getPages: AppRoutes.pages(),
      ),
    );
  }
}
