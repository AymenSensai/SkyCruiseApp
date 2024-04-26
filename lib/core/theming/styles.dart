import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cruise/core/theming/colors.dart';
import 'package:sky_cruise/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font16Neutral200Regular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.neutral200);
  static TextStyle font16Neutral900Medium = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.neutral900);
}
