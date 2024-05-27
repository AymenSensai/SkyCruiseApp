import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cruise/features/flight/presentation/controllers/flight_cubit.dart';
import 'package:sky_cruise/features/flight/presentation/screens/flight_payment.dart';
import 'package:sky_cruise/features/flight/presentation/screens/flight_ticket.dart';
import 'package:sky_cruise/features/flight/presentation/screens/select_seats.dart';

import '../../features/authentication/presentation/controllers/auth_cubit.dart';
import '../../features/authentication/presentation/screens/confirm_new_password.dart';
import '../../features/authentication/presentation/screens/confirm_otp_screen.dart';
import '../../features/authentication/presentation/screens/forget_password_screen.dart';
import '../../features/authentication/presentation/screens/sign_in_screen.dart';
import '../../features/authentication/presentation/screens/sign_up_screen.dart';
import '../../features/authentication/presentation/screens/welcome_screen.dart';
import '../../features/flight/presentation/screens/flight_details.dart';
import '../../features/home/presentation/controllers/home_cubit.dart';
import '../../features/home/presentation/screens/airport_search.dart';
import '../../features/home/presentation/screens/notification.dart';
import '../../features/profile/presentation/controllers/profile_cubit.dart';
import '../../features/profile/presentation/screens/language.dart';
import '../../features/profile/presentation/screens/notification_settings.dart';
import '../../features/profile/presentation/screens/passenger.dart';
import '../../features/profile/presentation/screens/passengers_list.dart';
import '../../features/profile/presentation/screens/payment_method.dart';
import '../../features/profile/presentation/screens/payment_methods.dart';
import '../../features/profile/presentation/screens/personal_info.dart';
import '../../features/profile/presentation/screens/security.dart';
import '../../features/search/presentation/controllers/search_cubit.dart';
import '../../features/search/presentation/screens/search.dart';
import '../di/dependency_injection.dart';
import '../widgets/app_home.dart';
import 'routes.dart';

class AppRouter {
  final authCubit = getIt<AuthCubit>();
  final homeCubit = getIt<HomeCubit>();
  final profileCubit = getIt<ProfileCubit>();
  final flightCubit = getIt<FlightCubit>();

  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      // auth
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.signIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const SignInScreen(),
          ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const SignUpScreen(),
          ),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.confirmOtp:
        final argumentsList = arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (_) =>
              ConfirmOtpScreen(code: argumentsList[0], email: argumentsList[1]),
        );
      case Routes.confirmNewPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: ConfirmNewPasswordScreen(email: arguments as String),
          ),
        );

      // home
      case Routes.airportSearch:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: homeCubit,
            child: AirportSearchScreen(title: arguments as String),
          ),
        );
      case Routes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      // profile
      case Routes.notificationSettings:
        return MaterialPageRoute(
            builder: (_) => const NotificationSettingsScreen());
      case Routes.language:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case Routes.security:
        return MaterialPageRoute(builder: (_) => const SecurityScreen());
      case Routes.personalInfo:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: profileCubit,
            child: const PersonalInfoScreen(),
          ),
        );
      case Routes.passengersList:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: profileCubit,
            child: const PassengersListScreen(),
          ),
        );
      case Routes.passenger:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: profileCubit,
            child: const PassengerScreen(),
          ),
        );
      case Routes.paymentMethods:
        return MaterialPageRoute(builder: (_) => const PaymentMethodsScreen());
      case Routes.paymentMethod:
        return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());

      // search
      case Routes.search:
        final argumentsList = arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SearchCubit>(),
            child: SearchScreen(
              departureAirport: argumentsList[0],
              arrivalAirport: argumentsList[1],
              departureDate: argumentsList[2],
              arrivalDate: argumentsList[3],
              numberOfPassengers: argumentsList[4],
              seatClass: argumentsList[5],
            ),
          ),
        );

      // flight Details
      case Routes.flightDetails:
        final argumentsList = arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: flightCubit,
            child: FlightDetailsScreen(
              flight: argumentsList[0],
              numberOfPassengers: argumentsList[1],
              seatClass: argumentsList[2],
            ),
          ),
        );
      case Routes.flightPayment:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: flightCubit,
            child: const FlightPaymentScreen(),
          ),
        );
      case Routes.selectSeat:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: flightCubit,
            child: const SelectSeatScreen(),
          ),
        );
      case Routes.flightTicket:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: flightCubit,
            child: const FlightTicketScreen(),
          ),
        );
      case Routes.appHome:
        return MaterialPageRoute(builder: (_) => const AppHome());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
