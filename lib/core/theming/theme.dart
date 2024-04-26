import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sky_cruise/core/theming/colors.dart';
import 'package:sky_cruise/core/theming/font_weight_helper.dart';

abstract class ThemeManager {
  static ThemeData getAppLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsManager.whiteBackground,
      primaryColor: ColorsManager.primary500,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: ColorsManager.primary500,
        iconTheme: IconThemeData(color: ColorsManager.neutral50),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeightHelper.bold,
            color: ColorsManager.neutral50,
            fontFamily: 'Inter'),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorsManager.primary500,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
      ),
    );
  }

  // static ThemeData getAppDarkTheme() {
  //   return ThemeData(
  //     scaffoldBackgroundColor: ColorsManager.darkBlue,
  //     primaryColor: ColorsManager.blue,
  //     fontFamily: 'Inter',
  //     appBarTheme: const AppBarTheme(
  //       elevation: 0,
  //       color: ColorsManager.darkBlue,
  //       iconTheme: IconThemeData(color: ColorsManager.neutral50),
  //       centerTitle: true,
  //       titleTextStyle: TextStyle(
  //           fontSize: 24,
  //           fontWeight: FontWeightHelper.bold,
  //           color: ColorsManager.white,
  //           fontFamily: 'Inter'),
  //       systemOverlayStyle: SystemUiOverlayStyle(
  //           statusBarColor: ColorsManager.darkBlue,
  //           statusBarIconBrightness: Brightness.light,
  //           statusBarBrightness: Brightness.light),
  //     ),
  //   );
  // }
}
