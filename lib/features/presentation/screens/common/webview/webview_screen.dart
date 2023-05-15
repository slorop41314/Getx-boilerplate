// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:getx_boilerplate/features/presentation/components/shared/shared.dart';
// import 'package:getx_boilerplate/features/presentation/utils/common.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebviewPage extends StatefulWidget {
//   WebviewPage({
//     required this.url,
//   });

//   final String url;
//   @override
//   _WebviewPageState createState() => _WebviewPageState();
// }

// class _WebviewPageState extends State<WebviewPage> {
//   double progresValue = 0;
//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       appBar: CustomAppBar(""),
//       body: Column(
//         children: [
//           LinearProgressIndicator(
//             value: progresValue,
//             backgroundColor: Colors.white,
//             valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
//           ),
//           Expanded(
//             child: Builder(builder: (BuildContext context) {
//               return WebViewWidget(
//                 initialUrl: widget.url,
//                 // javascriptMode: JavascriptMode.unrestricted,
//                 onWebViewCreated: (WebViewController webViewController) {
//                   _controller.complete(webViewController);
//                 },
//                 onProgress: (int progress) {
//                   setState(() {
//                     progresValue = progress.toDouble();
//                   });
//                 },
//                 // navigationDelegate: (NavigationRequest request) {
//                 //   if (progresValue >= 100) {
//                 //     return NavigationDecision.prevent;
//                 //   }
//                 //   return NavigationDecision.navigate;
//                 // },
//                 backgroundColor: Colors.white,
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
