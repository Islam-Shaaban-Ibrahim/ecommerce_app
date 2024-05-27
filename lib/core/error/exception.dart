abstract class AppException implements Exception {
  final String errorMessage;

  AppException(this.errorMessage);
}

class RemoteException extends AppException {
  RemoteException(super.errorMessage);
}

class LocalException extends AppException {
  LocalException(super.errorMessage);
}
