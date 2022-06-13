import 'package:flutter_test/flutter_test.dart';
import 'package:getx_boilerplate/features/domain/entities/user.dart';
import 'package:getx_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late LoginController sut;
  late AuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    sut = LoginController(
      authRepository: authRepository,
    );
  });

  group('Login Flow', () {
    test(
      "Should call Auth repository - login method when fire login",
      () async {
        // Arrange
        const email = "email@example.com";
        const password = "password123";
        when(
          authRepository.login(email, password),
        ).thenAnswer(
          (realInvocation) async => Future.error("Invalid email or password"),
        );

        // Act
        await sut.loginWithEmail(email, password).onError((error, stackTrace) {
          // Assert
          verify(authRepository.login(email, password)).called(1);
          verifyNoMoreInteractions(authRepository);
          return null;
          //
        });
      },
    );
    test("Should return User when success login", () async {
      // Arrange
      const email = "email@example.com";
      const password = "password123";
      final mockUser = User(
        email: email,
        name: "Test email",
      );
      when(
        authRepository.login(email, password),
      ).thenAnswer(
        (realInvocation)  => Future.value(mockUser),
      );

      // Act
      final response = await sut.loginWithEmail(email, password);

      // Assert
      verify(authRepository.login(email, password)).called(1);
      expect(response?.email, mockUser.email);
      expect(response?.name, mockUser.name);
      verifyNoMoreInteractions(authRepository);
    });
  });
}
