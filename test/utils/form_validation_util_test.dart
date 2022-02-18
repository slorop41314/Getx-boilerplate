import 'package:flutter_test/flutter_test.dart';
import 'package:getx_boilerplate/features/presentation/utils/form_validation_utils.dart';

void main() {
  group('Email validation', () {
    test(
      "Should return error message when email is empty or null",
      () async {
        final result = FormValidationUtils.isEmail(null);
        expect(result, "Email cannot be empty");
      },
    );
    test(
      "Should return error message when email is empty",
      () async {
        final result = FormValidationUtils.isEmail("");
        expect(result, "Email cannot be empty");
      },
    );

    test(
      "Should return message when email is not valid email",
      () async {
        final result = FormValidationUtils.isEmail("abcde");
        expect(result, "Email is not valid");
      },
    );

    test(
      "Should return null when email is passed validation",
      () async {
        final result = FormValidationUtils.isEmail("test@example.com");
        expect(result, null);
      },
    );
  });
}
