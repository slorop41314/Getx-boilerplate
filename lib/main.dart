import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/core/lang/lang_config.dart';
import 'package:getx_boilerplate/core/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:getx_boilerplate/features/presentation/routes/app_routes.dart';
import 'package:getx_boilerplate/features/presentation/utils/app_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SentryFlutter.init(
    (options) => options.dsn = sentryDsnKey,
    appRunner: () => runApp(App()),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
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
