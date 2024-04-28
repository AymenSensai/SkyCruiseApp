import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_cruise/core/theming/colors.dart';
import 'package:sky_cruise/core/utils/screen_utils.dart';
import 'package:sky_cruise/core/widgets/custom_text_form_field.dart';
import 'package:sky_cruise/core/routing/routes.dart';
import 'package:sky_cruise/core/widgets/app_text_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isValidEmail(String email, {bool isRequired = false}) {
    if (email.isEmpty) {
      return !isRequired;
    }
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPassword(String password, {bool isRequired = false}) {
    if (password.isEmpty) {
      return !isRequired;
    }
    // Implement your password validation logic here
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    bool isPasswordVisible = false;
    bool? isChecked = false;

    return Scaffold(
      body: SizedBox(
        height: 766.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            //primary500
            Container(
              height: screenHeight * 0.33,
              color: ColorsManager.primary500,
            ),
            // cancel (dont work )
            Positioned(
              top: 10,
              left: 100,
              child: GestureDetector(
                onTap: () {
                  print('Cancel button tapped');
                },
                child: SvgPicture.asset(
                  'assets/images/cancel.svg',
                  height: 48,
                  width: 48,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
            // map
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/map.png',
                height: screenHeight * 0.3,
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
            //white bg
            Positioned(
              top: screenHeight * 0.33,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: screenHeight * 1,
                decoration: const BoxDecoration(
                  color: ColorsManager.whiteBackground,
                ),
              ),
            ),
            // email
            Positioned(
              top: screenHeight * 0.36,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
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
                    SizedBox(height: 15.v),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      textStyle: const TextStyle(
                        color: Color(0xFF9E9E9E),
                      ),
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 22.v, 15.h, 22.v),
                        child: SvgPicture.asset(
                          'assets/images/img_mail.svg',
                          height: 14.v,
                          width: 16.v,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidEmail(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_email";
                        }
                        return null;
                      },
                      contentPadding: EdgeInsets.only(
                        top: 19.v,
                        right: 30.h,
                        bottom: 19.v,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // password
            Positioned(
              top: screenHeight * 0.52,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
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
                    SizedBox(height: 15.v),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Password',
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      textStyle: const TextStyle(
                        color: Color(0xFF9E9E9E),
                      ),
                      prefix: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.h,
                          vertical: 20.v,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/img_lock.svg',
                          height: 14.v,
                          width: 16.v,
                        ),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      suffix: InkWell(
                        onTap: () {
                          print('Before setState: $isPasswordVisible');
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                          print('After setState: $isPasswordVisible');
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 18.v, 16.h, 18.v),
                          child: SvgPicture.asset(
                            isPasswordVisible
                                ? 'assets/images/eye.svg'
                                : 'assets/images/img_eye.svg',
                            height: 22.v,
                            width: 16.v,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 60.v,
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "err_msg_please_enter_valid_password";
                        }
                        return null;
                      },
                      obscureText: !isPasswordVisible,
                    ),
                  ],
                ),
              ),
            ),
            // remember me row
            Positioned(
              top: screenHeight * 0.7,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
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
                              print('2');
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
                        Navigator.of(context).pushNamed(Routes.forgetPassword);
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
              ),
            ),
            // divider
            Positioned(
              top: screenHeight * 0.77,
              left: 0,
              right: 0,
              child: const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Divider(
                  color: ColorsManager.neutral100,
                ),
              ),
            ),
            // signup
            Positioned(
              top: screenHeight * 0.8,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
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
              ),
            ),
            //login button
            Positioned(
              top: screenHeight * 0.87,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: AppTextButton(
                  borderRadius: 16.0,
                  backgroundColor: ColorsManager.primary500,
                  horizontalPadding: 20.0,
                  verticalPadding: 10.0,
                  buttonWidth: 330.0,
                  buttonText: 'Login',
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  onPressed: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      // verifie si le compte existe ou idk
                      if (isValidEmail(emailController.text) &&
                          isValidPassword(passwordController.text)) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomQuickAlert(
                              message: 'Sign in Successful!',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomQuickAlert extends StatelessWidget {
  final String message;
  final bool isLoading;

  const CustomQuickAlert(
      {super.key, required this.message, this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15),
                Container(
                  width: 112.0,
                  height: 112.0,
                  decoration: BoxDecoration(
                    color: ColorsManager.primary500,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: ColorsManager.whiteBackground,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  message,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.primary500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please wait...\nYou will be directed to the homepage',
                  style:
                      TextStyle(fontSize: 14, color: ColorsManager.neutral900),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                if (isLoading)
                  SpinKitRing(
                    color: ColorsManager.primary500,
                    size: 40.0,
                    lineWidth: 3.0,
                  ),
              ],
            ),
          ),
          Positioned(
            top: 55,
            right: 56,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 19,
            right: 100,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 94,
            right: 75,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 125,
            right: 60,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 145,
            right: 100,
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 153,
            right: 174,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: 212,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 94,
            right: 226,
            child: Container(
              width: 2,
              height: 2,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 24,
            right: 200,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: ColorsManager.primary500,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
