import 'package:intl/intl.dart';

class CosFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat.yMMMMd().format(date);
  }

  // static String formatCurrency(double amount) {
  //   return NumberFormat.currency(locale: 'en_Us', symbol: "\$").format(amount);
  // }

  static String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'mn_MN', // Mongolian locale
      symbol: '₮', // Mongolian currency symbol
    );
    return formatter.format(amount);
  }

  // static String formatPhoneNumber(String phoneNumber) {
  //   // Assuming a 10-digit US phone number format: (123) 456-7890
  //   if (phoneNumber.length == 10) {
  //     return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
  //   } else if (phoneNumber.length == 11) {
  //     return '${phoneNumber.substring(0, 1)} (${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
  //   }
  //   // Add more custom phone number formatting logic for different formats if needed.
  //   return phoneNumber;
  // }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('976') && phoneNumber.length == 11) {
      return '(+${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3)}';
    }
    // Add more custom phone number formatting logic for different formats if needed.
    return phoneNumber;
  }

  // static String internationalFormatPhoneNumber(String phoneNumber) {
  //   // Remove any non-digit characters from the phone number
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

  //   // Extract the country code from the digitsOnly
  //   String countryCode = '+${digitsOnly.substring(0, 2)}';
  //   digitsOnly = digitsOnly.substring(2);

  //   // Add the remaining digits with proper formatting
  //   final formattedNumber = StringBuffer();
  //   formattedNumber.write('($countryCode)');

  //   int i = 0;
  //   while (i < digitsOnly.length) {
  //     int groupLength = 2;
  //     if (i == 0 && countryCode == '+1') {
  //       groupLength = 3;
  //     }

  //     int end = i + groupLength;
  //     formattedNumber.write(' ${digitsOnly.substring(i, end)}');

  //     i = end;
  //   }

  //   return formattedNumber.toString();
  // }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode =
        '+${digitsOnly.substring(0, 3)}'; // Assuming Mongolian country code is '+976'
    digitsOnly = digitsOnly.substring(3);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write(countryCode);

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength =
          4; // Assuming Mongolian phone numbers are formatted as XXXX XXXX
      int end = i + groupLength;

      formattedNumber.write(' ${digitsOnly.substring(i, end)}');

      i = end;
    }

    return formattedNumber.toString();
  }
}
