class CosFirebaseException implements Exception {
  final String code;

  CosFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'үл мэдэгдэх firebase алдаа гарлаа. Дахин оролдоно уу';
      case 'auth':
        return 'Auth алдаа гарлаа.';
      case 'invalid-custom-token':
        return 'Хавтасгуудын мэдээллийг зөвшөөрөгдөөгүй custom token.';
      case 'custom-token-mismatch':
        return 'Custom token таарахгүй байна.';
      case 'user-disabled':
        return 'Хэрэглэгч идэвхижүүлсэн байна.';
      case 'user-not-found':
        return 'Хэрэглэгч олдсонгүй.';
      case 'invalid-email':
        return 'Буруу и-мэйл хаяг.';
      case 'email-already-in-use':
        return 'Ингэснээр и-мэйл хаяг ашиглагдаж байна.';
      case 'wrong-password':
        return 'Буруу нууц үг.';
      case 'weak-password':
        return 'Нууц үг хялбар байхгүй байна.';
      case 'provider-already-linked':
        return 'Хэрэглэгч өмнө нь энэ провайдертэй холбогдсон байна.';
      case 'invalid-credential':
        return 'Буруу гарын үсэг.';
      case 'invalid-verifaction-id':
        return 'Буруу баталгаажуулах ID.';
      case 'captcha-check-failed':
        return 'Captcha шалгалт амжилтгүй болсон.';
      case 'app-not-authorized':
        return 'Аппыг зөвшөөрөгдөөгүй.';
      case 'keychain-error':
        return 'Keychain алдаа.';
      case 'internal-error':
        return 'Дотоод алдаа.';
      default:
        return 'Алдаа гарлаа.';
    }
  }
}
