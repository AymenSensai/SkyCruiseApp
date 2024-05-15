import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/map_section.dart';
import '../widgets/password_section.dart';

class ConfirmNewPasswordScreen extends StatefulWidget {
  const ConfirmNewPasswordScreen({super.key});

  @override
  State<ConfirmNewPasswordScreen> createState() =>
      _ConfirmNewPasswordScreenState();
}

class _ConfirmNewPasswordScreenState extends State<ConfirmNewPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

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
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 24.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              PasswordSection(
                                passwordController: newPasswordController,
                                text: 'New Password',
                              ),
                              verticalSpace(24),
                              PasswordSection(
                                passwordController:
                                    confirmNewPasswordController,
                                text: 'Confirm New Password',
                              ),
                            ],
                          ),
                          verticalSpace(48),
                          _saveButton(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveButton(BuildContext context) {
    return AppTextButton(
      buttonText: 'Save New Password',
      onPressed: () {},
    );
  }
}
