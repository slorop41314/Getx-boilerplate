import 'package:flutter/foundation.dart';

class PrintUtils {
  static void print(dynamic data) {
    if (kDebugMode) {
      debugPrint(
        data is String ? data : '$data',
      );
    }
  }
}
