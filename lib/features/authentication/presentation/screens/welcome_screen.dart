import 'package:flutter/material.dart';
import 'package:sky_cruise/core/theming/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_cruise/core/utils/screen_utils.dart';
import 'package:sky_cruise/core/widgets/app_text_button.dart';
import 'package:sky_cruise/core/routing/routes.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 766.v,
          width: double.maxFinite,
          child: Stack(
              alignment: Alignment.center,
              children: [
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
                Positioned(
                  top: 337.v,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/images/img_circle.svg',
                    height:135.v ,
                    width: 99.h,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
                Positioned(
                  top: 10.v,
                  left: 10.v,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/images/img_circle.svg',
                    height:135.v ,
                    width: 71.h,
                    alignment: Alignment.topRight,
                  ),
                ),
                Positioned(
                  top: 10.v,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/images/img_clouds.svg',
                    height: screenHeight * 0.6,
                    width: 375.h,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  top: 95.v,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/images/img_wlcm_plane.svg',
                    height: 222.v,
                    width: 217.h,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.55,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: screenHeight * 1,
                    decoration: const BoxDecoration(
                      color: ColorsManager.whiteBackground,
                    ),
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
                            padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
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
                          const SizedBox(height: 25.0),
                          AppTextButton(
                            borderRadius: 16.0,
                            backgroundColor: ColorsManager.primary500,
                            horizontalPadding: 20.0,
                            verticalPadding: 10.0,
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
