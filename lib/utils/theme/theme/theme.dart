import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/theme/custom_theme/text_theme.dart';

class FAppTheme {
  FAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: FAppColor.fGreen,
    scaffoldBackgroundColor: FAppColor.fWhite,
    textTheme: FTextTheme.lightTheme,
  );
}