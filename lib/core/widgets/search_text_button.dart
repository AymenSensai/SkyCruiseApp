import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';
import 'app_text_button.dart';

class SearchTextButton extends StatelessWidget {
  const SearchTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonHeight: 38,
      buttonWidth: 148.w,
      buttonText: 'Start your search',
      textStyle: TextStyles.font12Neutral50Semibold,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {},
    );
  }
}
