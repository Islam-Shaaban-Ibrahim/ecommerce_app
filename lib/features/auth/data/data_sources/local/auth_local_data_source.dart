abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String> getToken();
}
