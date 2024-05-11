import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: ColorsManager.primaryColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.w700, color: ColorsManager.whiteColor),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w300, color: ColorsManager.whiteColor),
      bodySmall: TextStyle(color: ColorsManager.whiteColor),
      bodyMedium: TextStyle(
          color: ColorsManager.whiteColor, fontWeight: FontWeight.w400),
    ),
  );
}
