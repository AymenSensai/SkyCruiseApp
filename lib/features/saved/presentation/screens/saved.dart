import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_button.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [emptySaved()],
            ),
          ),
        ),
      )),
    );
  }

  Widget emptySaved() {
    return Column(
      children: [
        SvgPicture.asset(Assets.savedIllustration),
        verticalSpace(32),
        Text(
          'Save what you like for later',
          style: TextStyles.font20Neutral900Bold,
        ),
        verticalSpace(32),
        Text(
          'Create lists of your favorite flights to help you share, compare and book.',
          style: TextStyles.font14Neutral900Regular,
          textAlign: TextAlign.center,
        ),
        verticalSpace(32),
        AppTextButton(
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
        )
      ],
    );
  }
}
