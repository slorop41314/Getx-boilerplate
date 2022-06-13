import 'package:getx_boilerplate/features/domain/entities/entity.dart';

abstract class LoginWithEmailUseCase {
  Future<User> execute(
    String email,
    String password,
  );
}
