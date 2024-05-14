import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
    required this.action,
    required this.text,
    required this.actionText,
  });

  final VoidCallback action;
  final String text;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: ColorsManager.neutral100,
          height: 24.h,
        ),
        verticalSpace(12),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: TextStyles.font14Neutral300Medium,
              ),
              TextSpan(
                  text: actionText,
                  style: TextStyles.font14Primary500Medium,
                  recognizer: TapGestureRecognizer()..onTap = () => action()),
            ],
          ),
        )
      ],
    );
  }
}
