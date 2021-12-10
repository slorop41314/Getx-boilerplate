import 'package:dio/dio.dart';
import 'package:getx_boilerplate/core/network/api_provider.dart';

abstract class AuthRemoteDataSource {
  Future<Response> login(Map<String, dynamic> data);
  Future<Response> resetPassword(Map<String, dynamic> data);
  Future<Response> changePassword(Map<String, dynamic> data);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiProvider apiProvider;

  AuthRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<Response> login(Map<String, dynamic> data) {
    return apiProvider.login(
      data,
    );
  }

  @override
  Future<Response> changePassword(Map<String, dynamic> data) {
    return apiProvider.changePassword(data);
  }

  @override
  Future<Response> resetPassword(Map<String, dynamic> data) {
    return apiProvider.resetPassword(data);
  }
}
