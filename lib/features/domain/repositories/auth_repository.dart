import 'package:getx_boilerplate/features/domain/entities/request/change_password_request.dart';
import 'package:getx_boilerplate/features/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> changePassword(ChangePasswordRequest request);

  User? getLoggedInUserData();
  Future<void> logout();
}
