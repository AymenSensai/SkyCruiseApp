import 'package:flutter/material.dart';
import 'package:sky_cruise/core/di/dependency_injection.dart';
import 'package:sky_cruise/core/routing/app_router.dart';
import 'package:sky_cruise/skycruise_app.dart';

Future<void> main() async {
  setupGetIt();

  runApp(SkyCruiseApp(appRouter: AppRouter()));
}
