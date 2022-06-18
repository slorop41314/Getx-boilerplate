import 'package:flutter_test/flutter_test.dart';
import 'package:getx_boilerplate/features/domain/entities/user.dart';
import 'package:getx_boilerplate/features/domain/usecases/impl/auth/login_with_email_use_case_impl.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([LoginWithEmailUseCase])
void main() {
  late LoginController sut;
  late LoginWithEmailUseCase loginWithEmailUseCase;

  setUp(() {
    loginWithEmailUseCase = MockLoginWithEmailUseCase();
    sut = LoginController(
      loginWithEmailUseCase: loginWithEmailUseCase,
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
          loginWithEmailUseCase.execute(email, password),
        ).thenAnswer(
          (realInvocation) async => Future.error("Invalid email or password"),
        );

        // Act
        await sut.loginWithEmail(email, password).onError((error, stackTrace) {
          // Assert
          verify(loginWithEmailUseCase.execute(email, password)).called(1);
          verifyNoMoreInteractions(loginWithEmailUseCase);
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
        loginWithEmailUseCase.execute(email, password),
      ).thenAnswer(
        (realInvocation)  => Future.value(mockUser),
      );

      // Act
      final response = await sut.loginWithEmail(email, password);

      // Assert
      verify(loginWithEmailUseCase.execute(email, password)).called(1);
      expect(response?.email, mockUser.email);
      expect(response?.name, mockUser.name);
      verifyNoMoreInteractions(loginWithEmailUseCase);
    });
  });
}
