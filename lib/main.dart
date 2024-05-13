import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'skycruise_app.dart';

Future<void> main() async {
  setupGetIt();

  runApp(SkyCruiseApp(appRouter: AppRouter()));
}
