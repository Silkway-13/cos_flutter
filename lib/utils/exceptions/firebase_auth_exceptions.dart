class CosFirebaseAuthException implements Exception {
  final String code;

  CosFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'Хөрвүүлэх имэйл хаяг.';
      case 'user-disabled':
        return 'Хэрэглэгчийн данс идэвхгүй болсон байна.';
      case 'user-not-found':
        return 'Хэрэглэгч олдсонгүй. Та шинэ хэрэглэгч бүртгүүлэх боломжтой.';
      case 'wrong-password':
        return 'Нууц үг буруу байна.';
      case 'weak-password':
        return 'Нууц үг хялбар байна. Өөр нууц үг сонгоно уу.';
      case 'email-already-in-use':
        return 'Имэйл аль хэдийн бүртгэлтэй байна. Өөр имэйл ашиглана уу?';
      case 'operation-not-allowed':
        return 'Операцийг хийхэд зөвшөөрөлгүй байна.';
      case 'requires-recent-login':
        return 'Дахин нэвтрэх шаардлагатай.';
      case 'credential-already-in-use':
        return 'Хэрэглэгчийн дансанд аль хэдийн холбогдсон данс байна.';
      case 'user-mismatch':
        return 'Олдсон хэрэглэгчийн мэдээлэл таарахгүй байна.';
      case 'expired-action-code':
        return 'Хугацаа нь дууссан баталгаажуулах код.';
      case 'user-token-expired':
        return 'Хэрэглэгчийн токен хугацаа нь дууссан.';
      case 'user-token-revoked':
        return 'Хэрэглэгчийн токен идэвхгүй болсон.';
      case 'user-not-found':
        return 'Хэрэглэгч олдсонгүй.';
      case 'invalid-sender':
        return 'Илгээгчийн имэйл хаяг хүчин төгөлдөр бус байна.';
      case 'invalid-recipient-email':
        return 'Хүлээн авагчийн имэйл хаяг буруу байна.';
      case 'network-request-failed':
        return 'Сүлжээ алдаатай байна. Та интернэт холболт шалгана уу.';
      case 'quota-exceeded':
        return 'Сервисийн хэрэглээ хүрэлцэх хугацаанд хязгаарыг хүрэлцэж байна. Та хэрэглээний хугацаанд дахин оролдоно уу.';
      default:
        return 'Алдаа гарлаа.';
    }
  }
}
