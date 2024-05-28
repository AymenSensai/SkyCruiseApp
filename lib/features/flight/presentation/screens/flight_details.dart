import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/flight.dart';
import '../../../search/domain/entities/flight.dart';
import '../controllers/flight_cubit.dart';
import '../controllers/flight_state.dart';
import '../widgets/contact_details.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/flight_app_bar.dart';
import '../widgets/passenger_details.dart';
import '../widgets/price_details.dart';

class FlightDetailsScreen extends StatefulWidget {
  const FlightDetailsScreen({
    super.key,
    required this.flight,
    this.numberOfPassengers,
    this.seatClass,
    this.arrivalDate,
  });

  final FlightEntity flight;
  final int? numberOfPassengers;
  final String? seatClass;
  final String? arrivalDate;

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  late FlightCubit cubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit = context.read<FlightCubit>();

    cubit.checkSavedFlight(widget.flight.id);
    cubit.fetchProfileAndPassengersAndReturnFlight(widget.arrivalDate);
    cubit.changeFlight(widget.flight);
    cubit.changeNumberOfPassengers(widget.numberOfPassengers ?? 1);
    cubit.changeSeatClass(widget.seatClass ?? 'Economy');
    cubit.getSeatsReserved();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const FlightAppBar(
        isBack: true,
      ),
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
              child: const CustomStepper(stepNumber: 1),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            bottom: 0,
            left: 0,
            right: 0,
            child: BlocBuilder<FlightCubit, FlightState>(
              buildWhen: (previous, current) =>
                  current is FlightLoading ||
                  current is FlightSuccess ||
                  current is FlightError,
              builder: (context, state) {
                return state.maybeWhen(
                    flightLoading: () {
                      return const Align(
                        alignment: Alignment.topCenter,
                        child: LinearProgressIndicator(
                            color: ColorsManager.primary500),
                      );
                    },
                    flightSuccess: (response) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 24.h),
                          child: Column(
                            children: [
                              Flight(flight: widget.flight),
                              cubit.arrivalFlight != null
                                  ? Flight(flight: cubit.arrivalFlight!)
                                  : const SizedBox.shrink(),
                              verticalSpace(16),
                              ContactDetails(
                                user: cubit.user,
                                onProfileChange: () =>
                                    _navigateAndReturnPersonalInfo(context),
                              ),
                              verticalSpace(24),
                              PassengerDetails(
                                passengers: cubit.passengers,
                                onAddPassenger: () =>
                                    _navigateAndReturnPassenger(context),
                              ),
                              verticalSpace(24),
                              _seatNumber(),
                              verticalSpace(24),
                              PriceDetails(
                                cityName:
                                    widget.flight.arrival.airport.cityName,
                              ),
                              verticalSpace(24),
                              _continue()
                            ],
                          ),
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink());
              },
            ),
          ),
        ],
      )),
    );
  }

  Future<void> _navigateAndReturnPersonalInfo(BuildContext context) async {
    final result = await context.pushNamed(Routes.personalInfo);
    cubit.emitUserState(result);
    if (!context.mounted) return;
  }

  Future<void> _navigateAndReturnPassenger(BuildContext context) async {
    final result = await context.pushNamed(Routes.passenger);
    cubit.emitPassengerState(result);
    if (!context.mounted) return;
  }

  _seatNumber() {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.selectSeat);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.neutral100, width: 1),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.classIcon,
                  colorFilter: const ColorFilter.mode(
                    ColorsManager.neutral900,
                    BlendMode.srcIn,
                  ),
                ),
                horizontalSpace(8),
                Text(
                  'Seat Number',
                  style: TextStyles.font14Neutral900Medium,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: ColorsManager.primary500,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _continue() {
    return AppTextButton(
      buttonText: 'Continue',
      onPressed: () {
        if (cubit.savedSeats.isEmpty) {
          errorSnackbar(context, 'Please select your seats!');
        } else if (cubit.user == null ||
            cubit.user!.username == null ||
            cubit.user!.phoneNumber == null) {
          errorSnackbar(context, 'Please Enter your personal info!');
        } else {
          context.pushNamed(Routes.flightPayment);
        }
      },
    );
  }
}
