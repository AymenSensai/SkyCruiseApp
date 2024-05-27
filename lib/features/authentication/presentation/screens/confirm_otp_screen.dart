import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/map_section.dart';

class ConfirmOtpScreen extends StatefulWidget {
  const ConfirmOtpScreen({super.key, required this.code, required this.email});

  final int code;
  final String email;

  @override
  State<ConfirmOtpScreen> createState() => _ConfirmOtpScreenState();
}

class _ConfirmOtpScreenState extends State<ConfirmOtpScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight();
    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            const MapSection(
              title: "Confirm OTP",
              description:
                  "We have sent an OTP code to your email ne*******r@gmail.com. Enter the OTP code below to verify.",
              isBackButton: true,
            ),
            Positioned(
              top: screenHeight * 0.33,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Column(
                    children: [
                      _otpField(context),
                      verticalSpace(32),
                      Text(
                        "Didn't receive email?",
                        style: TextStyles.font18Neutral900Regular,
                      ),
                      verticalSpace(24),
                      _resendCodeRow(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resendCodeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'You can resend code in ',
          style: TextStyles.font18Neutral900Regular,
        ),
        const ResendCodeCounter()
      ],
    );
  }

  Widget _otpField(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      filled: true,
      fillColor: ColorsManager.neutral100.withOpacity(0.2),
      fieldWidth: 72.w,
      borderRadius: BorderRadius.circular(20),
      showFieldAsBox: true,
      borderWidth: 1,
      borderColor: Colors.transparent,
      focusedBorderColor: ColorsManager.primary500,
      textStyle: TextStyles.font22Neutral900Bold,
      onSubmit: (String verificationCode) {
        if (verificationCode == widget.code.toString()) {
          context.pushReplacementNamed(Routes.confirmNewPassword,
              arguments: widget.email);
        }
      },
    );
  }
}

class ResendCodeCounter extends StatefulWidget {
  const ResendCodeCounter({super.key});

  @override
  State<ResendCodeCounter> createState() => _ResendCodeCounterState();
}

class _ResendCodeCounterState extends State<ResendCodeCounter> {
  late Timer _timer;
  late int _countDown;
  late bool _showHereText;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _countDown = 45;
    _showHereText = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_countDown == 0) {
        timer.cancel();
        setState(() {
          _showHereText = true;
        });
      } else {
        setState(() {
          _countDown--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: _showHereText ? 'here' : '$_countDown',
                style: TextStyles.font18Primary500Regular,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    if (_showHereText) {
                      _timer.cancel();
                      _startTimer();
                    }
                  }),
            if (!_showHereText)
              TextSpan(
                text: ' s',
                style: TextStyles.font18Neutral900Regular,
              )
          ]),
        )
      ],
    );
  }
}
