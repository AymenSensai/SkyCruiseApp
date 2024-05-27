import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_cruise/features/flight/domain/entities/reservation.dart';
import 'package:sky_cruise/features/trips/presentation/controllers/trips_cubit.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/flights_list_view.dart';
import '../../../../core/widgets/search_text_button.dart';
import '../controllers/trips_state.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TripsCubit>().getReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trips')),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocBuilder<TripsCubit, TripsState>(
            buildWhen: (previous, current) =>
                current is TripsSuccess || current is TripsLoading,
            builder: (context, state) {
              return state.maybeWhen(
                tripsSuccess: (data) {
                  final trips = data as List<ReservationEntity>;
                  if (trips.isEmpty) {
                    return Center(child: _emptyTrips());
                  } else {
                    return FlightsListView(
                        flights: trips.map((e) => e.flight).toList());
                  }
                },
                tripsError: (error) {
                  errorSnackbar(context, error);
                  return const SizedBox.shrink();
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      )),
    );
  }

  Widget _emptyTrips() {
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
