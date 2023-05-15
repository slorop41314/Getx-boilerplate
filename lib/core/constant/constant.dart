export './common_constant.dart';

class AppConst {
  static const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  static const baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'test');
}
