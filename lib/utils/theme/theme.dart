import 'package:flutter/material.dart';

import 'package:cos_work_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:cos_work_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:cos_work_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:cos_work_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:cos_work_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:cos_work_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:cos_work_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:cos_work_store/utils/theme/custom_themes/text_theme.dart';

class CosAppTheme {
  CosAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: CosTextTheme.lightTextTheme,
      chipTheme: CosChipTheme.lightChipTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: CosAppBarTheme.lightAppBarTheme,
      checkboxTheme: CosCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: CosBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: CosElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: CosOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: CosTextFormFieldTheme.lightInputDecorationTheme);

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: CosTextTheme.darkTextTheme,
      chipTheme: CosChipTheme.darkChipTheme,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: CosAppBarTheme.darkAppBarTheme,
      checkboxTheme: CosCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: CosBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: CosElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: CosOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: CosTextFormFieldTheme.darkInputDecorationTheme);
}
