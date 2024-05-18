import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../controllers/auth_cubit.dart';
import '../widgets/auth_bloc_listener.dart';
import '../widgets/email_section.dart';
import '../widgets/map_section.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
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
            title: "Forget password?",
            description:
                "Enter your email address and we’ll email you with an otp code to reset the password.",
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
                      Form(
                        key: _formKey,
                        child:
                            EmailTextField(emailController: _emailController),
                      ),
                      verticalSpace(48),
                      _continueButton(context),
                      AuthBlocListener(email: _emailController.text),
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

  AppTextButton _continueButton(BuildContext context) {
    return AppTextButton(
      buttonText: 'Continue',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<AuthCubit>().sendEmail(_emailController.text);
        }
      },
    );
  }
}
