import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/email_section.dart';
import '../widgets/have_account.dart';
import '../widgets/map_section.dart';
import '../widgets/name_section.dart';
import '../widgets/password_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            const MapSection(
              title: "Create Account",
              description:
                  "Sign up now to explore a world of destinations tailored to your preferences. Your next adventure awaits.",
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
                        NameSection(nameController: nameController),
                        verticalSpace(24),
                        EmailSection(emailController: emailController),
                        verticalSpace(24),
                        PasswordSection(
                          passwordController: passwordController,
                          text: 'Password',
                        ),
                        verticalSpace(16),
                        HaveAccount(
                          text: 'Already have an account yet? ',
                          actionText: 'Sign In',
                          action: () =>
                              context.pushReplacementNamed(Routes.signIn),
                        ),
                        verticalSpace(24),
                        AppTextButton(
                          buttonText: 'Create Account',
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
          ],
        ),
      ),
    );
  }
}
