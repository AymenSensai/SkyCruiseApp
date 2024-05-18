import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../controllers/auth_cubit.dart';
import '../widgets/auth_bloc_listener.dart';
import '../widgets/map_section.dart';
import '../widgets/password_section.dart';

class ConfirmNewPasswordScreen extends StatefulWidget {
  const ConfirmNewPasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<ConfirmNewPasswordScreen> createState() =>
      _ConfirmNewPasswordScreenState();
}

class _ConfirmNewPasswordScreenState extends State<ConfirmNewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight();
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            const MapSection(
              title: "Welcome Back",
              description:
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
              isBackButton: true,
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
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                PasswordSection(
                                  passwordController: _newPasswordController,
                                  text: 'New Password',
                                ),
                                verticalSpace(24),
                                PasswordSection(
                                  passwordController:
                                      _confirmNewPasswordController,
                                  text: 'Confirm New Password',
                                  otherText: _newPasswordController.text,
                                  useValidators: false,
                                ),
                              ],
                            ),
                          ),
                          verticalSpace(48),
                          _saveButton(context),
                          const AuthBlocListener(isRememberMeBoxChecked: true),
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
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context
              .read<AuthCubit>()
              .passwordReset(widget.email, _newPasswordController.text);
        }
      },
    );
  }
}
