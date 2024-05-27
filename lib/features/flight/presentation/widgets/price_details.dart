import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_cruise/features/flight/presentation/controllers/flight_cubit.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key, required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context) {
    final numberOfPassengers =
        BlocProvider.of<FlightCubit>(context).numberOfPassengers;
    final flight = BlocProvider.of<FlightCubit>(context).flight;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral100, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.dollar),
              horizontalSpace(8),
              Text(
                'Price Details',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          Divider(
            height: 24.h,
            thickness: 0.5,
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$cityName x$numberOfPassengers',
                  style: TextStyles.font14Neutral900Regular),
              Text(
                '${flight?.calculatePrice(numberOfPassengers!)} DA',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Travel Insurance x$numberOfPassengers',
                  style: TextStyles.font14Neutral900Regular),
              Text(
                '${flight?.calculateTravelInsurancePrice(numberOfPassengers!)} DA',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax x$numberOfPassengers',
                  style: TextStyles.font14Neutral900Regular),
              Text(
                '${flight?.calculateTaxPrice(numberOfPassengers!)} DA',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          Divider(
            height: 24.h,
            thickness: 0.5,
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Price', style: TextStyles.font14Neutral900Regular),
              Text(
                '${flight?.calculateTotalPrice(numberOfPassengers!)} DA',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
