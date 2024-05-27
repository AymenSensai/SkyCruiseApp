import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sky_cruise/features/search/presentation/controllers/search_cubit.dart';

import '../../features/search/domain/entities/flight.dart';
import '../utils/extensions.dart';
import '../utils/spacing.dart';
import '../utils/time_formating.dart';
import '../routing/routes.dart';
import '../theming/styles.dart';
import '../utils/assets.dart';

class Flight extends StatelessWidget {
  const Flight({super.key, required this.flight});

  final FlightEntity flight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.flightDetails, arguments: [
        flight,
        BlocProvider.of<SearchCubit>(context).numberOfPassengers,
        BlocProvider.of<SearchCubit>(context).seatClass,
      ]),
      child: Stack(
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
                                  flight.departure.airport.code,
                                  style: TextStyles.font14Neutral900Medium,
                                ),
                                Text(
                                  flight.departure.airport.cityName,
                                  style: TextStyles.font11Neutral300Regular,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  flight.arrival.airport.code,
                                  style: TextStyles.font14Neutral900Medium,
                                ),
                                Text(
                                  flight.arrival.airport.cityName,
                                  style: TextStyles.font11Neutral300Regular,
                                ),
                              ],
                            )
                          ],
                        ),
                        verticalSpace(8),
                        Text(
                          formatDuration(flight.arrival.date
                              .difference(flight.departure.date)),
                          style: TextStyles.font11Primary500Regular,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DateFormat('hh:mm').format(flight.departure.date),
                              style: TextStyles.font16Neutral900Semibold,
                            ),
                            SvgPicture.asset(Assets.airplaneDashes),
                            Text(
                              DateFormat('hh:mm').format(flight.arrival.date),
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
                        networkImage(flight.airline.logo,
                            height: 32, width: 32),
                        horizontalSpace(8),
                        Text(
                          flight.airline.name,
                          style: TextStyles.font12Neutral700Regular,
                        ),
                        const Spacer(),
                        Text(
                          '${flight.price} DA',
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
      ),
    );
  }
}
