import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/utils/shared_prefs.dart';
import 'skycruise_app.dart';

Future<void> main() async {
  setupGetIt();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SharedPreferencesService.initSharedPref();
  final initialRoute = SharedPreferencesService.getIsFirstTime() == null
      ? Routes.welcome
      : SharedPreferencesService.getToken() == null
          ? Routes.signIn
          : Routes.appHome;

  FlutterNativeSplash.remove();

  runApp(SkyCruiseApp(appRouter: AppRouter(), initialRoute: initialRoute));
}
