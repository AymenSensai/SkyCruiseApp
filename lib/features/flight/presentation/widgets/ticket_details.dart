import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/barcode_generator.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/time_formating.dart';
import '../../../search/domain/entities/flight.dart';
import '../../domain/entities/reservation.dart';
import '../controllers/flight_cubit.dart';

class TicketDetails extends StatelessWidget {
  final FlightEntity flight;
  final ReservationEntity reservation;
  final FlightCubit cubit;
  final String seatNumber;
  final String passengerName;

  const TicketDetails({
    super.key,
    required this.flight,
    required this.reservation,
    required this.cubit,
    required this.seatNumber,
    required this.passengerName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.neutral100, width: 1)),
        child: SingleChildScrollView(
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
                formatDuration(
                    flight.arrival.date.difference(flight.departure.date)),
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
              verticalSpace(16),
              SvgPicture.asset(Assets.dashes),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Passenger Name',
                        style: TextStyles.font14Neutral300Medium,
                      ),
                      Text(passengerName,
                          style: TextStyles.font16Neutral900Medium),
                      verticalSpace(24),
                      Text('Terminal',
                          style: TextStyles.font14Neutral300Medium),
                      Text(flight.departure.terminal,
                          style: TextStyles.font16Neutral900Medium),
                      verticalSpace(24),
                      Text('Seat', style: TextStyles.font14Neutral300Medium),
                      Text(seatNumber,
                          style: TextStyles.font16Neutral900Medium),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: TextStyles.font14Neutral300Medium,
                      ),
                      Text(
                          DateFormat('MMMM d, yyyy')
                              .format(flight.departure.date),
                          style: TextStyles.font16Neutral900Medium),
                      verticalSpace(24),
                      Text('Gate', style: TextStyles.font14Neutral300Medium),
                      Text(flight.departure.gate,
                          style: TextStyles.font16Neutral900Medium),
                      verticalSpace(24),
                      Text('Class', style: TextStyles.font14Neutral300Medium),
                      Text(cubit.seatClass,
                          style: TextStyles.font16Neutral900Medium),
                    ],
                  ),
                ],
              ),
              verticalSpace(16),
              SvgPicture.asset(Assets.dashes),
              verticalSpace(24),
              FutureBuilder<Widget>(
                future: BarcodeGenerator(reservation.number.toString())
                    .generateBarcode(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error generating barcode');
                    } else {
                      return snapshot.data!;
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              verticalSpace(16),
              Text(
                reservation.number.toString(),
                style: TextStyles.font12Primary500Regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
