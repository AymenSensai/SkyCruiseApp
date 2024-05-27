import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/theming/theme.dart';

class SkyCruiseApp extends StatelessWidget {
  final AppRouter appRouter;
  final Widget initialRoute;

  const SkyCruiseApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

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
        home: initialRoute,
      ),
    );
  }
}
