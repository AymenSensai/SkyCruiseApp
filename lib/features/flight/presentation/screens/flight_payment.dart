import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cruise/core/routing/routes.dart';
import 'package:sky_cruise/core/utils/extensions.dart';
import 'package:sky_cruise/features/flight/presentation/controllers/flight_cubit.dart';
import 'package:sky_cruise/features/flight/presentation/controllers/flight_state.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/flight.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/flight_app_bar.dart';
import '../widgets/price_details.dart';

class FlightPaymentScreen extends StatefulWidget {
  const FlightPaymentScreen({super.key});

  @override
  State<FlightPaymentScreen> createState() => _FlightPaymentScreenState();
}

class _FlightPaymentScreenState extends State<FlightPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final flight = context.read<FlightCubit>().flight!;
    final numberOfPassengers = context.read<FlightCubit>().numberOfPassengers!;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const FlightAppBar(isBack: true),
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
              child: const CustomStepper(stepNumber: 2),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  children: [
                    Flight(flight: flight),
                    verticalSpace(24),
                    PriceDetails(cityName: flight.arrival.airport.cityName),
                    verticalSpace(24),
                    _payNow(flight.calculateTotalPrice(numberOfPassengers)),
                    _flightBlocListener()
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _payNow(double price) {
    return AppTextButton(
      buttonText: 'Pay Now',
      onPressed: () {
        context.read<FlightCubit>().makePayment(price, "DZD");
      },
    );
  }

  Widget _flightBlocListener() {
    return BlocListener<FlightCubit, FlightState>(
      listenWhen: (previous, current) => current is FlightSuccess,
      listener: (context, state) {
        state.whenOrNull(
          flightSuccess: (response) => context.pushNamed(Routes.flightTicket),
          flightError: (error) => errorSnackbar(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
