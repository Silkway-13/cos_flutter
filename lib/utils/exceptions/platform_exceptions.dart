class CosPlatformException implements Exception {
  final String code;

  CosPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Нэвтрэхэд алдаа гарлаа. Мэдээллээ шалгана уу?';
      case 'FIREBASE_EXCEPTION':
        return 'Firebase platform алдаа гарлаа.';
      case 'ANOTHER_FIREBASE_ERROR':
        return 'Бусад Firebase алдаа гарлаа.';
      default:
        return 'unknown platform error';
    }
  }
}
