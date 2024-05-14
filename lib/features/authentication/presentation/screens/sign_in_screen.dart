import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_checkbox.dart';
import '../widgets/email_section.dart';
import '../widgets/map_section.dart';
import '../widgets/password_section.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            const MapSection(
              title: "Welcome Back",
              description:
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
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
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: Column(
                      children: [
                        EmailSection(emailController: emailController),
                        verticalSpace(24),
                        PasswordSection(
                          passwordController: passwordController,
                          text: 'Password',
                        ),
                        verticalSpace(16),
                        _rememberMe(context),
                        Divider(
                          color: ColorsManager.neutral100,
                          height: 24.h,
                        ),
                        verticalSpace(12),
                        _haveAccount(context),
                        verticalSpace(24),
                        AppTextButton(
                          buttonText: 'Login',
                          onPressed: () {
                            context.pushNamed(Routes.appHome);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // cancel
          ],
        ),
      ),
    );
  }

  Row _haveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account? ',
          style: TextStyles.font14Neutral300Medium,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.signUp);
          },
          child: Text(
            'Join us',
            style: TextStyles.font14Primary500Medium,
          ),
        ),
      ],
    );
  }

  Row _rememberMe(BuildContext context) {
    return Row(
      children: [
        const CustomCheckbox(),
        Text(
          'Remember me',
          style: TextStyles.font12Neutral300Regular,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.forgetPassword);
          },
          child: Text(
            'Forgot Password?',
            style: TextStyles.font12Primary500Regular,
          ),
        ),
      ],
    );
  }
}
