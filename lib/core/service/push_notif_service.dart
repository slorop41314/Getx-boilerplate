// import 'dart:math' show Random;

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:getx_boilerplate/core/local/shared_pref.dart';

// class PushNotificationService extends GetxService {
//   final SharedPreferencesManager sharedPref;

//   PushNotificationService({
//     required this.sharedPref,
//   });
//   late final _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static const _androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'bawal_express',
//     'bawal_express',
//     'Bawal Express Notification',
//     importance: Importance.max,
//     priority: Priority.high,
//     ticker: 'ticker',
//   );

//   @override
//   void onInit() {
//     print("HERE pUSH NOTIF");
//     _initialise();
//     super.onInit();
//   }

//   /// initialize notification listner
//   void _initialise() async {
//     const andSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
//     late final iosSettings = IOSInitializationSettings();

//     late final initializationSettings = InitializationSettings(
//       android: andSettings,
//       iOS: iosSettings,
//     );

//     try {
//       await _flutterLocalNotificationsPlugin.initialize(
//         initializationSettings,
//         onSelectNotification: _onSelectLocalNotification,
//       );
//     } catch (e) {
//       debugPrint('FCM initialise Error $e');
//     }

//     final fcmToken = await FirebaseMessaging.instance.getToken();
//     this
//         .sharedPref
//         .putString(SharedPreferencesManager.keyFcmToken, fcmToken ?? "");

//     FirebaseMessaging.onMessage.listen(_onMessageReceive);

//     // Also handle any interaction when the app is in the background via a
//     // Stream listener
//     FirebaseMessaging.onMessageOpenedApp.listen(_onResumeFromFCM);

//     final message = await FirebaseMessaging.instance.getInitialMessage();
//     if (message != null) {
//       _onLaunchFromFCM(message);
//     }
//   }

//   Future _onSelectLocalNotification(String? payload) async {}

//   /// resume app on tap notiifcation
//   Future _onResumeFromFCM(RemoteMessage? message) async {
//     debugPrint("onResume: $message");
//     try {
//       // onTapNotification(fcm);
//     } catch (e) {
//       debugPrint('onResume FCM Error $e');
//     }
//   }

//   /// called  when notification is tapped and app is closed
//   Future _onLaunchFromFCM(RemoteMessage? message) async {
//     try {
//       // onTapNotification(fcm);
//     } catch (e) {
//       debugPrint('onLaunch FCM Error $e');
//     }
//   }

//   /// notification came from firebase
//   Future _onMessageReceive(RemoteMessage? message) async {
//     try {
//       debugPrint("onMessage: $message");
//       // late final fcm = FcmPayloadModel.fromJson(message!.data);
//       if (message?.notification != null) {
//         _sendLocalNotification(message!);
//       }
//     } catch (e) {
//       debugPrint('onMessage Error $e');
//     }
//   }

//   void _sendLocalNotification(RemoteMessage notifMessage) async {
//     const platformChannelSpecifics = NotificationDetails(
//       android: _androidPlatformChannelSpecifics,
//     );
//     try {
//       final title = notifMessage.notification?.title;
//       final body = notifMessage.notification?.body;
//       final payload = notifMessage.senderId;

//       await FlutterLocalNotificationsPlugin().show(
//         Random().nextInt(100),
//         title,
//         body,
//         platformChannelSpecifics,
//         payload: payload,
//       );
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   /// called when notification is tapped
//   Future onTapNotification() async {
//     // Get.toNamed(
//     //   data.actionType!,
//     //   arguments: NavArgsModel(
//     //     data: data.actionId,
//     //   ),
//     // );
//   }

//   static PushNotificationService get find => Get.find();
// }
