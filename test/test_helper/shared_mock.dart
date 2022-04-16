import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGet extends Mock implements GetInterface {}

void main() {
  late GetInterface getx;

  setUp(() {
    getx = MockGet();
  });

  group(
    '',
    () {
      when(
        () => getx.toNamed(""),
      ).thenReturn(
        Future.value(true),
      );
    },
  );
}
