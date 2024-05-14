import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key, required this.onValueChanged});

  final VoidCallback onValueChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AppTextButton(
          buttonText: 'Cancel',
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side:
                  const BorderSide(color: ColorsManager.primary500, width: 1.0),
            ),
          ),
          backgroundColor: Colors.transparent,
          textStyle: TextStyles.font12Primary500Semibold,
          buttonHeight: 38,
          onPressed: () => context.pop(),
        )),
        horizontalSpace(24),
        Expanded(
            child: AppTextButton(
          buttonText: 'OK',
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            context.pop();
            onValueChanged();
          },
          textStyle: TextStyles.font12Neutral50Semibold,
          buttonHeight: 38,
        ))
      ],
    );
  }
}
