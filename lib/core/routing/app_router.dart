import 'package:flutter/material.dart';
import 'package:sky_cruise/core/routing/routes.dart';
import 'package:sky_cruise/features/authentication/presentation/screens/confirm_new_password.dart';
import 'package:sky_cruise/features/authentication/presentation/screens/confirm_otp_screen.dart';
import 'package:sky_cruise/features/authentication/presentation/screens/forget_password_screen.dart';
import 'package:sky_cruise/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:sky_cruise/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:sky_cruise/features/authentication/presentation/screens/welcome_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.confirmOtp:
        return MaterialPageRoute(builder: (_) => const ConfirmOtpScreen());
      case Routes.confirmNewPassword:
        return MaterialPageRoute(
            builder: (_) => const ConfirmNewPasswordScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("No route defined for ${settings.name}")),
                ));
    }
  }
}
