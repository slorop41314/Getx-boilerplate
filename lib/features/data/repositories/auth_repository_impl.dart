import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getx_boilerplate/core/network/api_provider.dart';
import 'package:getx_boilerplate/features/data/datasources/auth/auth_local_data_source.dart';
import 'package:getx_boilerplate/features/data/datasources/auth/auth_remote_data_source.dart';
import 'package:getx_boilerplate/features/domain/entities/user.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final ApiProvider apiProvider;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.apiProvider,
    required this.localDataSource,
  });

  Future<User> login(String email, String password) async {
    try {
      final param = {
        "email": email,
        "password": password,
      };
      final response = await this.remoteDataSource.login(param);
      if (response.statusCode == 200) {
        final bodyData = response.data["data"];
        await this.localDataSource.saveAuthToken(
              bodyData["token"],
            );
        await this.localDataSource.saveSessionData(
              jsonEncode(bodyData["user"]),
            );
        return User.fromJson(bodyData["user"]);
      }
      throw response;
    } on DioError catch (err) {
      return Future.error(err);
    }
  }

  User? getLoggedInUserData() {
    final data = this.localDataSource.getSessionData();
    if (data == null) return null;

    return User.fromJson(
      jsonDecode(data),
    );
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
