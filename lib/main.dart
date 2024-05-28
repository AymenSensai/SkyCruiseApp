import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/utils/shared_prefs.dart';
import 'core/widgets/app_home.dart';
import 'features/authentication/presentation/screens/sign_in_screen.dart';
import 'features/authentication/presentation/screens/welcome_screen.dart';
import 'skycruise_app.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: ".env");
  setupGetIt();

  await SharedPreferencesService.initSharedPref();
  final token = SharedPreferencesService.getToken();
  final initialRoute = SharedPreferencesService.getIsFirstTime() == null
      ? const WelcomeScreen()
      : (token == null || token == '')
          ? const SignInScreen()
          : const AppHome();

  FlutterNativeSplash.remove();

  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;

  runApp(SkyCruiseApp(appRouter: AppRouter(), initialRoute: initialRoute));
}
