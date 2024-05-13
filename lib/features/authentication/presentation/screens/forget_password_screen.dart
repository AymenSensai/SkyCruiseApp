import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/utils/email_validator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();

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
              //primary color
              Container(
                height: screenHeight * 0.31,
                color: ColorsManager.primary500,
              ),
              // map
              Positioned(
                top: 0,
                left: 0,
                right: 0,
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
                top: 130,
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(top: 0, left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forget password?',
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorsManager.whiteBackground,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Enter your email address and we’ll email you with an otp code to reset the password. ',
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
                top: screenHeight * 0.34,
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  child: Column(
                    children: [
                      // frgt password ill
                      Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/forgot_password_illustration.jpg',
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      //  email
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h),
                          AppTextField(
                            controller: emailController,
                            hintText: 'Email',
                            prefixIcon: Container(
                              margin:
                                  EdgeInsets.fromLTRB(16.h, 22.h, 15.h, 22.h),
                              child: SvgPicture.asset(
                                'assets/svgs/img_mail.svg',
                                height: 14.h,
                                width: 16.w,
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_email";
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 26),
                      // get started button
                      AppTextButton(
                        borderRadius: 16.0,
                        backgroundColor: ColorsManager.primary500,
                        buttonWidth: 330.0,
                        buttonText: 'Get Started',
                        textStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        onPressed: () async {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.confirmOtp);
                          // bool emailExists = await verifyEmailExists(emailController.text);
                          //
                          // if (emailExists) {
                          //   Navigator.of(context).pushReplacementNamed(Routes.confirmOtp);
                          // } else {
                          //
                          //   showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return CustomQuickAlert(
                          //         message: 'Email Not Found',
                          //         isLoading: false,
                          //       );
                          //     },
                          //   );
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // back button
              Positioned(
                top: 70,
                left: 18,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(Routes.signIn);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: ColorsManager.whiteBackground,
                    )),
              ),
            ],
          )),
    ));
  }
}
