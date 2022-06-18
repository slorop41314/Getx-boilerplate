import 'package:dio/dio.dart';
import 'package:getx_boilerplate/core/constant/constant.dart';
import 'package:getx_boilerplate/core/network/api_interceptor.dart';

abstract class ApiProvider {
  Future<Response> login(
    Map<String, dynamic> data,
  );
  Future<Response> resetPassword(
    Map<String, dynamic> data,
  );
  Future<Response> changePassword(
    Map<String, dynamic> data,
  );
}

class ApiProviderImpl implements ApiProvider {
  final Dio _dio = Dio(options);

  ApiProviderImpl(ApiInterceptor apiInterceptor) {
    _dio.interceptors.add(apiInterceptor);
  }
  static BaseOptions options = BaseOptions(
    baseUrl: "${AppConst.baseUrl}/api",
    contentType: "application/json",
    followRedirects: false,
    responseType: ResponseType.plain,
    connectTimeout: 30000,
    receiveTimeout: 30000,
    validateStatus: (status) {
      return status! < 500;
    },
  );

  @override
  Future<Response> login(Map<String, dynamic> data) {
    return _dio.post(
      "/login",
      data: data,
    );
  }

  @override
  Future<Response> changePassword(Map<String, dynamic> data) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Response> resetPassword(Map<String, dynamic> data) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
