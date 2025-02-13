import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';


class FTextTheme {
  FTextTheme._();

  static TextTheme lightTheme = TextTheme(
    // heading
    headlineLarge: const TextStyle().copyWith(fontSize: 32, fontWeight: FontWeight.w500, color: FAppColor.fBlack),
    headlineMedium: const TextStyle().copyWith(fontSize: 22, fontWeight: FontWeight.w600, color: FAppColor.fBlack),
    headlineSmall: const TextStyle().copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: FAppColor.fBlack),

    // titles
    titleLarge: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: FAppColor.fBlack),
    titleMedium: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: FAppColor.fBlack),
    titleSmall: const TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: FAppColor.fBlack),

    // body
    bodyLarge: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: FAppColor.fBlack),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: FAppColor.fBlack),
    bodySmall: const TextStyle().copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: FAppColor.fBlack),

    // labels
    labelLarge: const TextStyle().copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: FAppColor.fBlack),
    labelMedium: const TextStyle().copyWith(fontSize: 10, fontWeight: FontWeight.w500, color: FAppColor.fBlack),
    labelSmall: const TextStyle().copyWith(fontSize: 8, fontWeight: FontWeight.w400, color: FAppColor.fBlack),
  );
}