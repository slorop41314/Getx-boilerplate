import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getx_boilerplate/core/local/secure_storage.dart';
import 'package:getx_boilerplate/core/local/shared_pref.dart';
import 'package:getx_boilerplate/core/utils/print_utils.dart';

class ApiInterceptor extends Interceptor {
  late SecureStorageManager sharedPreferencesManager;

  ApiInterceptor({
    required this.sharedPreferencesManager,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.data != null && !(options.data is! FormData)) {
      PrintUtils.print(
        "Body: ${jsonEncode(options.data)}, path: ${options.path}",
      );
    }
    final accessToken = await sharedPreferencesManager.getString(
      SharedPreferencesManager.keyAccessToken,
    );
    options.headers.addAll({
      "Accept": "application/json",
    });
    if (accessToken != null) {
      options.headers.addAll({
        "Authorization": "Bearer $accessToken",
      });
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    PrintUtils.print(
      "Response: ${response.statusCode} ${response.realUri} ${response.data}",
    );
    final _responseData = response.data;
    if (_responseData is String) {
      response.data = jsonDecode(_responseData);
    }
    return handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // final refreshDio = Dio();
    PrintUtils.print(
      '<--${err.type} ${err.response != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}',
    );
    PrintUtils.print(
      "${err.response != null ? err.response?.data : 'Unknown Error'}",
    );
    PrintUtils.print("<-- End error");
    if (err.response?.statusCode == 403) {
      // Refresh token function here
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}
