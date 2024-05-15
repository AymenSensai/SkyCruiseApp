import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/email_section.dart';
import '../widgets/map_section.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: screenHeight,
      child: Stack(
        children: [
          const MapSection(
            title: "Forget password?",
            description:
                "Enter your email address and we’ll email you with an otp code to reset the password. ",
            isBackButton: true,
          ),
          Positioned(
            top: screenHeight * 0.33,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(Assets.forgetPasswordIllustration),
                      verticalSpace(24),
                      EmailTextField(emailController: emailController),
                      verticalSpace(48),
                      AppTextButton(
                        buttonText: 'Get Started',
                        onPressed: () {
                          context.pushReplacementNamed(Routes.confirmOtp);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
