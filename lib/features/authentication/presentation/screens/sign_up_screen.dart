import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../controllers/auth_cubit.dart';
import '../widgets/auth_bloc_listener.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
              title: "Create Account",
              description:
                  "Sign up now to explore a world of destinations tailored to your preferences. Your next adventure awaits.",
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
                        _signUpForm(),
                        verticalSpace(16),
                        HaveAccount(
                          text: 'Already have an account yet? ',
                          actionText: 'Sign In',
                          action: () =>
                              context.pushReplacementNamed(Routes.signIn),
                        ),
                        verticalSpace(24),
                        _createAccountButton(context),
                        const AuthBlocListener(isRememberMeBoxChecked: true),
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

  Widget _signUpForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          NameSection(nameController: _nameController),
          verticalSpace(24),
          EmailSection(emailController: _emailController),
          verticalSpace(24),
          PasswordSection(
            passwordController: _passwordController,
            text: 'Password',
          ),
        ],
      ),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return AppTextButton(
      buttonText: 'Create Account',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<AuthCubit>().signUp(
                _nameController.text,
                _emailController.text,
                _passwordController.text,
              );
        }
      },
    );
  }
}
