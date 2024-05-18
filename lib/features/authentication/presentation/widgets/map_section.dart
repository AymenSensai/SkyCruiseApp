import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';

class MapSection extends StatelessWidget {
  const MapSection(
      {super.key,
      required this.title,
      required this.description,
      required this.isBackButton});

  final String title;
  final String description;
  final bool isBackButton;

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight();
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.33,
          color: ColorsManager.primary500,
        ),
        Positioned(
          child: Image.asset(
            Assets.map,
            height: screenHeight * 0.3,
            width: double.infinity,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: IconButton(
              onPressed: () => isBackButton
                  ? context.pop()
                  : context.pushNamedAndRemoveUntil(
                      Routes.appHome,
                      predicate: (Route<dynamic> route) => false,
                    ),
              icon: Icon(
                isBackButton ? Icons.arrow_back_rounded : Icons.close_rounded,
                color: ColorsManager.neutral50,
              ),
            ),
          ),
        ),
        Positioned(
          height: screenHeight * 0.33,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyles.font28Neutral50Bold,
                      ),
                      verticalSpace(4),
                      Text(
                        description,
                        style: TextStyles.font16Neutral50Regular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
