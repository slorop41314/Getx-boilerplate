import 'package:getx_boilerplate/features/domain/entities/entity.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:getx_boilerplate/features/domain/usecases/impl/auth/login_with_email_use_case_impl.dart';

class LoginWithEmailUseCaseImpl implements LoginWithEmailUseCase {
  final AuthRepository authRepository;

  LoginWithEmailUseCaseImpl({
    required this.authRepository,
  });

  @override
  Future<User> execute(
    String email,
    String password,
  ) async {
    return authRepository.login(email, password);
  }
}
