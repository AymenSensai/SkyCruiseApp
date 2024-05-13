import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/search_text_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trips')),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [emptyTrips()],
          ),
        ),
      )),
    );
  }

  Widget emptyTrips() {
    return Column(
      children: [
        SvgPicture.asset(Assets.tripsIllustration),
        Text(
          'No tickets found',
          style: TextStyles.font20Neutral900Bold,
        ),
        verticalSpace(24),
        Text(
          'Start exploring and booking flights now to discover new destinations and create unforgettable memories.',
          style: TextStyles.font14Neutral900Regular,
          textAlign: TextAlign.center,
        ),
        verticalSpace(24),
        const SearchTextButton()
      ],
    );
  }
}
