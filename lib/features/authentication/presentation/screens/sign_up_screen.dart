import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_cruise/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cruise/core/widgets/app_text_form_field.dart';
import 'package:sky_cruise/core/routing/routes.dart';
import 'package:sky_cruise/core/widgets/app_text_button.dart';
import 'package:sky_cruise/core/utils/email_validator.dart';
import 'package:sky_cruise/core/utils/password_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;
  bool? isChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

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
                height: screenHeight * 0.322,
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
              //  text
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
                        "Creat Account",
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorsManager.whiteBackground,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Sign up now to explore a world of destinations tailored to your preferences. Your next adventure awaits.",
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
                top: screenHeight * 0.33,
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: Column(
                    children: [
                      // name
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name',
                                style: TextStyle(
                                  color: ColorsManager.primary900,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              AppTextField(
                                controller: nameController,
                                hintText: 'Name',
                                prefixIcon: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      16.h, 22.h, 15.h, 22.h),
                                  child: SvgPicture.asset(
                                    'assets/svgs/user.svg',
                                    height: 14.h,
                                    width: 16.h,
                                    color: ColorsManager.neutral200,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_name";
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 25.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style: TextStyle(
                                  color: ColorsManager.primary900,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              AppTextField(
                                controller: emailController,
                                hintText: 'Email',
                                prefixIcon: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      16.h, 22.h, 15.h, 22.h),
                                  child: SvgPicture.asset(
                                    'assets/svgs/img_mail.svg',
                                    height: 14.h,
                                    width: 16.h,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "err_msg_please_enter_valid_email";
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 25.0),
                          // password
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Password',
                                style: TextStyle(
                                  color: ColorsManager.primary900,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              AppTextField(
                                controller: passwordController,
                                hintText: 'Password',
                                prefixIcon: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      16.h, 22.h, 15.h, 22.h),
                                  child: SvgPicture.asset(
                                    'assets/svgs/img_lock.svg',
                                    height: 14.h,
                                    width: 16.h,
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
                      const SizedBox(height: 13),
                      // divider
                      const Divider(
                        color: ColorsManager.neutral100,
                      ),
                      const SizedBox(height: 13),
                      // signin
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account yet? ',
                            style: TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(Routes.signUp);
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: ColorsManager.primary500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      //login button
                      AppTextButton(
                        borderRadius: 16.0,
                        backgroundColor: ColorsManager.primary500,
                        buttonWidth: 330.0,
                        buttonText: 'Create Account',
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        onPressed: () {
                          // if (isValidEmail(emailController.text) && isValidPassword(passwordController.text)) {
                          //       // await saveUserInfoToDatabase(
                          //       //   name: nameController.text,
                          //       //   email: emailController.text,
                          //       //   password: passwordController.text,
                          //       // );
                          //       //
                          //       // // Navigate to the home page
                          //       // Navigator.of(context).pushReplacementNamed(Routes.home);
                          //       // } else {
                          //       //   print('Invalid email or password');
                          //       //
                          //       // }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // cancel
              Positioned(
                top: 60,
                left: 18,
                child: GestureDetector(
                  onTap: () {
                    print('Cancel button tapped');
                    //navigate to home page
                  },
                  child: SvgPicture.asset(
                    'assets/svgs/img_cancel.svg',
                    height: 20,
                    width: 16,
                    alignment: Alignment.center,
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
