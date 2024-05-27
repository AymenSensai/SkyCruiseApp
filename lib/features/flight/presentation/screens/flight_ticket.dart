import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sky_cruise/features/search/domain/entities/flight.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/barcode_generator.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/time_formating.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../controllers/flight_cubit.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/flight_app_bar.dart';

class FlightTicketScreen extends StatefulWidget {
  const FlightTicketScreen({super.key});

  @override
  State<FlightTicketScreen> createState() => _FlightTicketScreenState();
}

class _FlightTicketScreenState extends State<FlightTicketScreen> {
  late final FlightEntity flight;
  late final FlightCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<FlightCubit>();
    flight = cubit.flight!;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const FlightAppBar(isBack: false),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              height: screenHeight * 0.13,
              left: 0,
              right: 0,
              child: Container(
                color: ColorsManager.primary500,
                height: 100.h,
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h),
                child: const CustomStepper(stepNumber: 3),
              ),
            ),
            Positioned(
              top: screenHeight * 0.13,
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
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
                              Text(cubit.user?.username ?? '-',
                                  style: TextStyles.font16Neutral900Medium),
                              verticalSpace(24),
                              Text('Terminal',
                                  style: TextStyles.font14Neutral300Medium),
                              Text(flight.departure.terminal,
                                  style: TextStyles.font16Neutral900Medium),
                              verticalSpace(24),
                              Text('Seat',
                                  style: TextStyles.font14Neutral300Medium),
                              Text(cubit.savedSeats.first,
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
                              Text('Gate',
                                  style: TextStyles.font14Neutral300Medium),
                              Text(flight.departure.gate,
                                  style: TextStyles.font16Neutral900Medium),
                              verticalSpace(24),
                              Text('Class',
                                  style: TextStyles.font14Neutral300Medium),
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
                        future:
                            BarcodeGenerator('FL123456789').generateBarcode(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
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
                      verticalSpace(24),
                      _downloadTickets()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _downloadTickets() {
    return AppTextButton(buttonText: 'Download Tickets', onPressed: () {});
  }
}
