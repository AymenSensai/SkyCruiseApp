import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_quick_alert.dart';
import '../../../../core/utils/email_validator.dart';
import '../../../../core/utils/password_validator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordVisible = false;
  bool? isChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              // welcome text
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
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorsManager.whiteBackground,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
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
                      // email and password
                      Column(
                        children: [
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
                                    width: 16.w,
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
                      const SizedBox(height: 14),
                      // remember me row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                activeColor: ColorsManager.neutral200,
                                checkColor: ColorsManager.primary500,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                },
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Color(0xFF9E9E9E),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.forgetPassword);
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: ColorsManager.primary500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 13),
                      // divider
                      const Divider(
                        color: ColorsManager.neutral100,
                      ),
                      const SizedBox(height: 13),
                      // signup
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Don’t have an account? ',
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
                              'Join us',
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
                        buttonText: 'Login',
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        onPressed: () {
                          Future.delayed(const Duration(seconds: 2), () {
                            // verifies si le compte existe ou idk
                            if (isValidEmail(emailController.text) &&
                                isValidPassword(passwordController.text)) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CustomQuickAlert(
                                    message: 'Sign in Successful!',
                                    text:
                                        'Please wait...You will be directed to the homepage',
                                  );
                                },
                              );
                              Future.delayed(const Duration(minutes: 60), () {
                                //navigation to home page a corriger !!!
                                Navigator.of(context)
                                    .pushReplacementNamed(Routes.confirmOtp);
                              });
                            } else {
                              print('err');
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return const CustomQuickAlert(
                              //       message: 'Error! Invalid email or password.',
                              //     );
                              //   },
                              // );
                            }
                          });
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
