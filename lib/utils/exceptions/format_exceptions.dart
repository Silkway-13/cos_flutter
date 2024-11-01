class CosFormatException implements Exception {
  final String message;

  const CosFormatException(
      [this.message =
          'An unexpected format error occured. Please check your input.']);

  factory CosFormatException.fromMessage(String message) {
    return CosFormatException(message);
  }

  String get formattedMessage => message;

  factory CosFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const CosFormatException(
            "Имэйлийг формат буруу байна. Зөв имэйл оруулна уу?");
      case 'invalid-phone-number-format':
        return const CosFormatException(
            "Утасны дугаар буруу байна. Зөв дугаар оруулна уу?");
      case 'invalid-email-format':
        return const CosFormatException(
            "Имэйлийг формат буруу байна. Зөв имэйл оруулна уу?");
      default:
        return CosFormatException(
            'Ямар нэг мэдээллийг алдаатай форматтай байна.');
    }
  }
}
