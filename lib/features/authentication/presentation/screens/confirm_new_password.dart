import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_cruise/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cruise/core/widgets/app_text_form_field.dart';
import 'package:sky_cruise/core/routing/routes.dart';
import 'package:sky_cruise/core/widgets/app_text_button.dart';
import 'package:sky_cruise/core/widgets/custom_quick_alert.dart';
import 'package:sky_cruise/core/utils/password_validator.dart';

class ConfirmNewPasswordScreen extends StatefulWidget {
  const ConfirmNewPasswordScreen({super.key});

  @override
  State<ConfirmNewPasswordScreen> createState() =>
      _ConfirmNewPasswordScreenState();
}

class _ConfirmNewPasswordScreenState extends State<ConfirmNewPasswordScreen> {
  bool isPasswordVisible = false;
  bool? isChecked = false;

  final TextEditingController newpasswordController1 = TextEditingController();
  final TextEditingController newpasswordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 766.h,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              //primary500
              Container(
                height: screenHeight * 0.33,
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
              // text
              const Positioned(
                top: 120,
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm New Password",
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorsManager.whiteBackground,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Create your new password. if you forget it, then you have to do forgot password.",
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
              //
              Positioned(
                top: screenHeight * 0.36,
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: Column(
                    children: [
                      // password
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'New Password',
                            style: TextStyle(
                              color: ColorsManager.primary900,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          AppTextField(
                            controller: newpasswordController1,
                            hintText: 'Password',
                            prefixIcon: Container(
                              margin:
                                  EdgeInsets.fromLTRB(16.h, 22.h, 15.h, 22.h),
                              child: SvgPicture.asset(
                                'assets/svgs/img_lock.svg',
                                height: 14.h,
                                width: 16.w,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password";
                              }
                              return null;
                            },
                            isObscureText: !isPasswordVisible,
                          )
                        ],
                      ),
                      // password
                      Column(
                        children: [
                          const SizedBox(height: 25.0),
                          // password
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Confirm New Password',
                                style: TextStyle(
                                  color: ColorsManager.primary900,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              AppTextField(
                                controller: newpasswordController2,
                                hintText: 'Password',
                                prefixIcon: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      16.h, 22.h, 15.h, 22.h),
                                  child: SvgPicture.asset(
                                    'assets/svgs/img_lock.svg',
                                    height: 14.h,
                                    width: 16.w,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_password";
                                  }
                                  return null;
                                },
                                isObscureText: !isPasswordVisible,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 177),
                      //login button
                      AppTextButton(
                        borderRadius: 16.0,
                        backgroundColor: ColorsManager.primary500,
                        horizontalPadding: 20.0,
                        verticalPadding: 10.0,
                        buttonWidth: 330.0,
                        buttonText: 'Save New Password',
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomQuickAlert(
                                message: 'Reset Password Successful!',
                                text:
                                    'Please wait...You will be directed to the homepage',
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // back
              Positioned(
                top: 60,
                left: 18,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(Routes.signIn);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: ColorsManager.whiteBackground,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
