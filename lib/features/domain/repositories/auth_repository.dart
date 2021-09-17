import 'package:getx_boilerplate/features/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);

  User? getLoggedInUserData();
  Future<void> logout();
}
