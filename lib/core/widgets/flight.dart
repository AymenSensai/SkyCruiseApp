import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/spacing.dart';
import '../theming/styles.dart';
import '../utils/assets.dart';

class Flight extends StatelessWidget {
  const Flight({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.overlay),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NYC',
                                style: TextStyles.font14Neutral900Medium,
                              ),
                              Text(
                                'New York City',
                                style: TextStyles.font11Neutral300Regular,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'VN',
                                style: TextStyles.font14Neutral900Medium,
                              ),
                              Text(
                                'Da Nang, Vietnam',
                                style: TextStyles.font11Neutral300Regular,
                              ),
                            ],
                          )
                        ],
                      ),
                      verticalSpace(8),
                      Text(
                        '1h45m',
                        style: TextStyles.font11Primary500Regular,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '14:50',
                            style: TextStyles.font16Neutral900Semibold,
                          ),
                          SvgPicture.asset(Assets.airplaneDashes),
                          Text(
                            '18:25',
                            style: TextStyles.font16Neutral900Semibold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpace(16),
                SvgPicture.asset(Assets.dashes),
                verticalSpace(8),
                Text(
                  'Non-Stop',
                  style: TextStyles.font12Neutral300Regular,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Image.asset(Assets.airAlgerieLogo),
                      horizontalSpace(8),
                      Text(
                        'Air Algerie',
                        style: TextStyles.font12Neutral700Regular,
                      ),
                      const Spacer(),
                      Text(
                        '\$242',
                        style: TextStyles.font16Primary500Semibold,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
