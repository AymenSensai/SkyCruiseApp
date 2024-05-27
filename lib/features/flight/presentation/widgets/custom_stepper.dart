import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key, required this.stepNumber});

  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _stepItem(1, "Book", true, stepNumber > 1),
        _rectangle(
          stepNumber > 1 ? ColorsManager.neutral50 : ColorsManager.primary700,
        ),
        _stepItem(2, "Pay", stepNumber >= 2, stepNumber == 3),
        _rectangle(
          stepNumber == 3 ? ColorsManager.neutral50 : ColorsManager.primary700,
        ),
        _stepItem(3, "E-Ticket", stepNumber == 3, stepNumber == 3),
      ],
    );
  }

  Widget _rectangle(Color color) {
    return Container(
      width: 75.w,
      height: 3.h,
      margin: EdgeInsets.only(top: 16.h),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(1)),
    );
  }

  Widget _stepItem(
      int stepNumber, String stepText, bool isActive, bool isChecked) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                isActive ? ColorsManager.neutral50 : ColorsManager.primary700,
          ),
          child: isChecked
              ? const Icon(
                  Icons.check_rounded,
                  color: ColorsManager.primary500,
                  size: 18,
                )
              : Text(
                  stepNumber.toString(),
                  style: isActive
                      ? TextStyles.font16Primary500Medium
                      : TextStyles.font16Neutral50Medium,
                ),
        ),
        verticalSpace(8),
        Text(
          stepText,
          style: TextStyles.font14Neutral50Medium,
        ),
      ],
    );
  }
}
