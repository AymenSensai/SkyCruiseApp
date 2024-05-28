import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../search/domain/entities/flight.dart';
import '../../domain/entities/reservation.dart';
import '../controllers/flight_cubit.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/flight_app_bar.dart';
import '../widgets/ticket_details.dart';

class FlightTicketScreen extends StatefulWidget {
  const FlightTicketScreen({super.key, required this.reservation});

  final ReservationEntity reservation;

  @override
  State<FlightTicketScreen> createState() => _FlightTicketScreenState();
}

class _FlightTicketScreenState extends State<FlightTicketScreen> {
  late final FlightEntity flight;
  late final FlightCubit cubit;

  @override
  void initState() {
    super.initState();
    flight = widget.reservation.flight;
    cubit = context.read<FlightCubit>();
    if (cubit.isSaved == null) {
      cubit.checkSavedFlight(flight.id);
    }
    cubit.saveSeats(widget.reservation.reservationSeats
        .map((e) => e.seat.seatNumber)
        .toList());
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
              child: PageView.builder(
                itemCount: widget.reservation.reservationSeats.length,
                itemBuilder: (context, index) {
                  final seat = widget.reservation.reservationSeats[index];
                  return TicketDetails(
                    flight: flight,
                    reservation: widget.reservation,
                    cubit: cubit,
                    seatNumber: seat.seat.seatNumber,
                    passengerName: seat.passenger.name!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
