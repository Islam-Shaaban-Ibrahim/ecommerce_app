import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData mainTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManager.primaryColor),
      centerTitle: true,
    ),
    splashFactory: NoSplash.splashFactory,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      enableFeedback: false,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.primaryColor,
      selectedItemColor: ColorsManager.primaryColor,
      selectedIconTheme: IconThemeData(
        color: ColorsManager.primaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: ColorsManager.whiteColor,
      ),
      unselectedItemColor: ColorsManager.whiteColor,
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    primaryColor: ColorsManager.primaryColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.w700, color: ColorsManager.whiteColor),
      titleMedium: TextStyle(
          fontWeight: FontWeight.w700, color: ColorsManager.blackColor),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w300, color: ColorsManager.whiteColor),
      bodySmall: TextStyle(color: ColorsManager.whiteColor),
      bodyMedium: TextStyle(
        color: ColorsManager.whiteColor,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
