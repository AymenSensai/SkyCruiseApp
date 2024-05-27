import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/search/domain/entities/flight.dart';
import 'flight.dart';

class FlightsListView extends StatelessWidget {
  const FlightsListView({super.key, required this.flights});

  final List<FlightEntity> flights;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 24.h),
      separatorBuilder: (context, index) => const SizedBox.shrink(),
      itemCount: flights.length,
      itemBuilder: (context, index) {
        final flight = flights[index];
        return Flight(flight: flight);
      },
    );
  }
}
