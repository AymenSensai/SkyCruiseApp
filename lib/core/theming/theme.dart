import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'font_weight_helper.dart';

abstract class ThemeManager {
  static ThemeData getAppLightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsManager.whiteBackground,
      primaryColor: ColorsManager.primary500,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorsManager.primary500,
        selectionColor: ColorsManager.primary500,
        selectionHandleColor: ColorsManager.primary500,
      ),
      fontFamily: 'Inter',
      checkboxTheme: const CheckboxThemeData(
        side: BorderSide(width: 2, color: ColorsManager.neutral200),
      ),
      datePickerTheme:
          DatePickerThemeData(backgroundColor: ColorsManager.whiteBackground),
      radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? ColorsManager.primary500
                  : ColorsManager.primary300)),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: ColorsManager.primary500,
        iconTheme: IconThemeData(color: ColorsManager.neutral50),
        centerTitle: false,
        titleSpacing: 24,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeightHelper.bold,
            color: ColorsManager.neutral50,
            fontFamily: 'Inter'),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorsManager.primary500,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light),
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
