import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:getx_boilerplate/core/network/api_provider.dart';
import 'package:getx_boilerplate/core/utils/print_utils.dart';
import 'package:getx_boilerplate/features/data/datasources/auth/auth_local_data_source.dart';
import 'package:getx_boilerplate/features/data/datasources/auth/auth_remote_data_source.dart';
import 'package:getx_boilerplate/features/domain/entities/request/change_password_request.dart';
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

  @override
  Future<User> login(String email, String password) async {
    try {
      final param = {
        "email": email,
        "password": password,
      };
      final response = await remoteDataSource.login(param);
      if (response.statusCode == 200) {
        final bodyData = response.data["data"];
        await localDataSource.saveAuthToken(
              bodyData["token"] as String,
            );
        await localDataSource.saveSessionData(
              jsonEncode(bodyData["user"]),
            );
        return User.fromJson(bodyData["user"]);
      }
      throw response;
    } on DioError catch (err) {
      return Future.error(err);
    }
  }

  @override
  User? getLoggedInUserData() {
    final data = localDataSource.getSessionData();
    if (data == null) return null;

    return User.fromJson(
      jsonDecode(data),
    );
  }

  @override
  Future<void> logout() async {
    localDataSource.clearSessionData();
  }

  @override
  Future<void> changePassword(ChangePasswordRequest request) async {
    try {
      await remoteDataSource.resetPassword(
        request.toJson(),
      );
      return;
    } catch (err) {
      PrintUtils.print(err);
      return Future.error(err);
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      final request = {
        "email": email,
      };
      await remoteDataSource.resetPassword(request);
      return;
    } catch (err) {
      print(err);
      return Future.error(err);
    }
  }
}
