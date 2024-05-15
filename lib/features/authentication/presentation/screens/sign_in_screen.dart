import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_checkbox.dart';
import '../widgets/email_section.dart';
import '../widgets/have_account.dart';
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
              isBackButton: false,
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
                        HaveAccount(
                          text: 'Don’t have an account? ',
                          actionText: 'Join us',
                          action: () =>
                              context.pushReplacementNamed(Routes.signUp),
                        ),
                        verticalSpace(24),
                        _loginButton(context),
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

  Widget _rememberMe(BuildContext context) {
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

  Widget _loginButton(BuildContext context) {
    return AppTextButton(
      buttonText: 'Login',
      onPressed: () {
        context.pushNamed(Routes.appHome);
      },
    );
  }
}
