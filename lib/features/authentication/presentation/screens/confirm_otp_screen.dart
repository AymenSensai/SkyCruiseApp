import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/routing/routes.dart';
import 'dart:async';

import '../../../../core/widgets/app_text_form_field.dart';

class ConfirmOtpScreen extends StatefulWidget {
  const ConfirmOtpScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOtpScreen> createState() => _ConfirmOtpScreenState();
}

class _ConfirmOtpScreenState extends State<ConfirmOtpScreen> {
  late Timer _timer;
  int _countDown = 45;
  bool _showHereText = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
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
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: 766.h,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            //primary color
            Container(
              height: screenHeight * 0.31,
              color: ColorsManager.primary500,
            ),
            // map
            Positioned(
              child: Image.asset(
                'assets/images/map.png',
                height: screenHeight * 0.3,
                width: double.infinity,
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            // back button
            Positioned(
              top: 70,
              left: 18,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      // .pushReplacementNamed(Routes.forgetPassword);
                      .pushReplacementNamed(Routes.confirmNewPassword);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: ColorsManager.whiteBackground,
                ),
              ),
            ),
            // text
            const Positioned(
              top: 110,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm OTP',
                      style: TextStyle(
                        fontSize: 28,
                        color: ColorsManager.whiteBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'We have sent an OTP code to your email ne*******r@gmail.com. Enter the OTP code below to verify.',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorsManager.whiteBackground,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            // OTP input
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 280, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.h),
                          child: AppTextField(
                            hintText: '',
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: AppTextField(
                            hintText: '',
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: AppTextField(
                            hintText: '',
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: AppTextField(
                            hintText: '',
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Didn't receive email?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'You can resend code in ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '$_countDown s',
                        style: TextStyle(
                          color: _countDown == 0
                              ? ColorsManager.primary500
                              : const Color(0xFF9E9E9E),
                          fontSize: 16,
                        ),
                      ),
                      if (_showHereText)
                        GestureDetector(
                          onTap: () {
                            _timer.cancel();
                            setState(() {
                              _countDown = 45;
                              _startTimer(); // Restart the timer
                              _showHereText = false; // Hide "here" text
                            });
                          },
                          child: Text(
                            ' here',
                            style: TextStyle(
                              color: _countDown == 0
                                  ? Colors.transparent
                                  : ColorsManager.primary500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
