import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const AppTextField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.backgroundColor,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.primary500,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.error500,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.error500,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintStyle: hintStyle ?? TextStyles.font16Neutral200Regular,
          hintText: hintText,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: SvgPicture.asset(
                    prefixIcon!,
                    colorFilter: const ColorFilter.mode(
                      ColorsManager.neutral200,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? ColorsManager.neutral100opac20,
          filled: true,
        ),
        inputFormatters: inputFormatters,
        obscureText: isObscureText ?? false,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        style: TextStyles.font16Neutral900Medium,
        cursorColor: ColorsManager.primary500,
        validator: (value) {
          return validator(value);
        });
  }
}
