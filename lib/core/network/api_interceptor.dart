import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getx_boilerplate/core/local/shared_pref.dart';

class ApiInterceptor extends Interceptor {
  late SharedPreferencesManager sharedPreferencesManager;

  ApiInterceptor({
    required this.sharedPreferencesManager,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data != null && !(options.data is FormData)) {
      print("Body: ${jsonEncode(options.data)}, path: ${options.path}");
    }
    final accessToken = this
        .sharedPreferencesManager
        .getString(SharedPreferencesManager.keyAccessToken);
    if (accessToken != null) {
      options.headers.addAll({
        "Authorization": "Bearer $accessToken",
      });
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "Response: ${response.statusCode} ${response.realUri} ${response.data}");

    response.data = jsonDecode(response.data);

    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final refreshDio = Dio();
    print(
        "<-- ${err.message} ${(err.response != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
    print("${err.response != null ? err.response!.data : 'Unknown Error'}");
    print("<-- End error");
    if (err.response?.statusCode == 403) {
      // Refresh token function here
      return handler.next(err);
    } else {
      return handler.next(err);
    }
  }
}
