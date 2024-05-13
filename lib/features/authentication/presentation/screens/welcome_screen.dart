import 'package:flutter/material.dart';
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
          width: double.maxFinite,
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
                  'assets/svgs/img_circle.svg',
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
                  'assets/svgs/img_circle2.svg',
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
                  'assets/svgs/img_clouds.svg',
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
                  'assets/svgs/img_wlcm_plane.svg',
                  height: 222.h,
                  width: 217.w,
                  alignment: Alignment.topCenter,
                ),
              ),
              // text and button
              Positioned(
                top: screenHeight * 0.55,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Explore Exciting",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Destinations",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                      child: Text(
                        "SkyCruise: Book flights in seconds. Real-time updates, easy itinerary management, and secure payments. Your travel companion awaits.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFA3A3A3),
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    AppTextButton(
                      borderRadius: 16.0,
                      backgroundColor: ColorsManager.primary500,
                      buttonWidth: 330.0,
                      buttonText: 'Get Started',
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.signIn);
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
