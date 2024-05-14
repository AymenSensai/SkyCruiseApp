import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
        Positioned(
          height: screenHeight * 0.33,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.close_rounded,
                      color: ColorsManager.neutral50,
                      size: 32,
                    ),
                  ),
                  Spacer(),
                  Text(
                    title,
                    style: TextStyles.font28Neutral50Bold,
                  ),
                  verticalSpace(4),
                  Text(
                    description,
                    style: TextStyles.font16Neutral50Regular,
                  ),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
