import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Security'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h),
            child: Column(
              children: [
                _securityRow(
                    'Password',
                    'Reset your password regularly to keep your account secure',
                    () {},
                    screenWidth),
                _securityRow(
                    'Two-factor authentication',
                    'Add a phone number to set up two-factor authentication',
                    () {},
                    screenWidth),
                _securityRow(
                    'Active sessions',
                    'Sign out from all the active sessions',
                    () {},
                    screenWidth),
                verticalSpace(20),
                _deleteAccountButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _securityRow(String title, String description, VoidCallback onTap,
      double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.font16Neutral900Medium,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: ColorsManager.neutral900,
              )
            ],
          ),
          verticalSpace(8),
          SizedBox(
            width: screenWidth - 100.w,
            child: Text(
              description,
              style: TextStyles.font14Neutral800Regular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _deleteAccountButton() {
    return AppTextButton(
      buttonText: 'Delete Account',
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(color: ColorsManager.error500, width: 1.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      textStyle: TextStyles.font16Error500Semibold,
      onPressed: () {},
    );
  }
}
