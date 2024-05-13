import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.buttonHeight,
    this.buttonWidth,
    this.textStyle,
    this.shape,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: shape ??
            MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
              ),
            ),
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? ColorsManager.primary500,
        ),
        fixedSize: MaterialStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 55),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle ?? TextStyles.font16Neutral50Semibold,
      ),
    );
  }
}
