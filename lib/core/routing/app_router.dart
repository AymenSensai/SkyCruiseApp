import 'package:flutter/material.dart';
import '../../features/profile/presentation/screens/notificationSettings.dart';
import '../../features/search/presentation/screens/search.dart';
import 'routes.dart';
import '../../features/authentication/presentation/screens/confirm_new_password.dart';
import '../../features/authentication/presentation/screens/confirm_otp_screen.dart';
import '../../features/authentication/presentation/screens/forget_password_screen.dart';
import '../../features/authentication/presentation/screens/sign_in_screen.dart';
import '../../features/authentication/presentation/screens/sign_up_screen.dart';
import '../../features/authentication/presentation/screens/welcome_screen.dart';
import '../../features/home/presentation/screens/Home.dart';
import '../../features/home/presentation/screens/airport_search.dart';
import '../../features/home/presentation/screens/notification.dart';
import '../../features/profile/presentation/screens/profile.dart';
import '../../features/saved/presentation/screens/saved.dart';
import '../../features/trips/presentation/screens/trips.dart';

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
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case Routes.confirmOtp:
        return MaterialPageRoute(builder: (_) => const ConfirmOtpScreen());
      case Routes.confirmNewPassword:
        return MaterialPageRoute(
            builder: (_) => const ConfirmNewPasswordScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.airportSearch:
        return MaterialPageRoute(
            builder: (_) => AirportSearchScreen(title: arguments as String));
      case Routes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      case Routes.saved:
        return MaterialPageRoute(builder: (_) => const SavedScreen());
      case Routes.trips:
        return MaterialPageRoute(builder: (_) => const TripsScreen());

      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.notificationSettings:
        return MaterialPageRoute(
            builder: (_) => const NotificationSettingsScreen());

      case Routes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("No route defined for ${settings.name}")),
                ));
    }
  }
}
