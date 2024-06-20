class LoginException implements Exception {
  final String message;

  LoginException(this.message);
}

class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}
