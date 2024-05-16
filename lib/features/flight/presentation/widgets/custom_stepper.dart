import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _stepItem(
          1,
          "Book",
          true,
        ),
        Container(
          width: 75.w,
          height: 3.h,
          margin: EdgeInsets.only(top: 16.h),
          decoration: BoxDecoration(
              color: ColorsManager.primary700,
              borderRadius: BorderRadius.circular(1)),
        ),
        _stepItem(2, "Pay", false),
        Container(
          width: 75.w,
          height: 3.h,
          margin: EdgeInsets.only(top: 16.h),
          decoration: BoxDecoration(
              color: ColorsManager.primary700,
              borderRadius: BorderRadius.circular(1)),
        ),
        _stepItem(3, "E-Ticket", false),
      ],
    );
  }

  Widget _stepItem(int stepNumber, String stepText, bool isActive) {
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
          child: Text(
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
