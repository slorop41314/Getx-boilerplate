abstract class AuthRepository {
  Future<dynamic> login(String email, String password);

  dynamic? checkIsLoggedIn();
}
