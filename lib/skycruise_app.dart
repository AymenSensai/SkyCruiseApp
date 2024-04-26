import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cruise/core/routing/app_router.dart';
import 'package:sky_cruise/core/routing/routes.dart';
import 'package:sky_cruise/core/theming/theme.dart';

class SkyCruiseApp extends StatelessWidget {
  final AppRouter appRouter;

  const SkyCruiseApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SkyCruise',
            theme: ThemeManager.getAppLightTheme(),
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: Routes.welcome));
  }
}
