import 'package:flutter/material.dart';
import 'package:sky_cruise/core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 766.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // primary
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenHeight * 0.55,
                  decoration: const BoxDecoration(
                    color: ColorsManager.primary500,
                  ),
                ),
              ),
              // circle
              Positioned(
                top: 337.h,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  Assets.leftCircle,
                  height: 135.h,
                  width: 99.h,
                  alignment: Alignment.bottomLeft,
                ),
              ),
              // circle
              Positioned(
                top: 10.h,
                left: 10.h,
                right: 0,
                child: SvgPicture.asset(
                  Assets.rightCircle,
                  height: 135.h,
                  width: 71.h,
                  alignment: Alignment.topRight,
                ),
              ),
              // clouds
              Positioned(
                top: 10.h,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  Assets.clouds,
                  height: screenHeight * 0.6,
                  width: 375.w,
                  alignment: Alignment.topCenter,
                ),
              ),
              // plane
              Positioned(
                top: 95.h,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  Assets.logo,
                  height: 222.h,
                  width: 217.w,
                  alignment: Alignment.topCenter,
                  colorFilter: const ColorFilter.mode(
                      ColorsManager.neutral50, BlendMode.srcIn),
                ),
              ),
              // text and button
              Positioned(
                top: screenHeight * 0.55,
                left: 16.w,
                right: 16.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace(16),
                    Text(
                      "Explore Exciting Destinations",
                      style: TextStyles.font32Neutral900Bold,
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(14),
                    Text(
                      "SkyCruise: Book flights in seconds. Real-time updates, easy itinerary management, and secure payments. Your travel companion awaits.",
                      style:
                          TextStyles.font14Neutral300Medium.copyWith(height: 2),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: 'Get Started',
                      onPressed: () {
                        context.pushReplacementNamed(Routes.signIn);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
