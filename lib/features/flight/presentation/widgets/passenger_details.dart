import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../profile/domain/entities/passenger.dart';
import '../controllers/flight_cubit.dart';

class PassengerDetails extends StatefulWidget {
  const PassengerDetails(
      {super.key, required this.onAddPassenger, required this.passengers});

  final List<PassengerEntity>? passengers;
  final VoidCallback onAddPassenger;

  @override
  State<PassengerDetails> createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
  late FlightCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<FlightCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final passengers = widget.passengers!.map((e) => e.name!).toList();
    return Container(
      padding: EdgeInsets.only(left: 16.w),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral100, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.contact),
              horizontalSpace(8),
              Text(
                'Passenger(s) Details',
                style: TextStyles.font14Neutral900Medium,
              ),
              const Spacer(),
              IconButton(
                onPressed: () => widget.onAddPassenger(),
                icon: const Icon(
                  Icons.add_rounded,
                  color: ColorsManager.primary500,
                ),
              )
            ],
          ),
          Divider(thickness: 0.5, endIndent: 16.w),
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cubit.numberOfPassengers,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: PassengerDropDown(
                      passengers: passengers,
                      onPassengerAdded: (passenger) =>
                          onPassengerAdded(passenger, index),
                      index: index,
                      selectedPassengers: cubit.selectedPassengers),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onPassengerAdded(String passenger, int index) {
    cubit.changePassengers(passenger, index);
  }
}

class PassengerDropDown extends StatefulWidget {
  const PassengerDropDown({
    super.key,
    required this.passengers,
    required this.onPassengerAdded,
    required this.index,
    required this.selectedPassengers,
  });

  final List<String> passengers;
  final Function(String) onPassengerAdded;
  final int index;
  final List<String> selectedPassengers;

  @override
  State<PassengerDropDown> createState() => _PassengerDropDownState();
}

class _PassengerDropDownState extends State<PassengerDropDown> {
  String? passenger;

  @override
  Widget build(BuildContext context) {
    if (widget.selectedPassengers.length > widget.index) {
      passenger = widget.selectedPassengers[widget.index];
    }
    return DropdownButtonFormField<String>(
      hint: Text(
        'Passenger',
        style: TextStyles.font16Neutral200Regular,
      ),
      value: passenger,
      icon: SvgPicture.asset(
        Assets.arrowDownward,
        colorFilter:
            const ColorFilter.mode(ColorsManager.neutral900, BlendMode.srcIn),
      ),
      items: widget.passengers
          .toList()
          .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
          .toList(),
      onChanged: (value) {
        setState(() {
          passenger = value;
        });
        widget.onPassengerAdded(value!);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.neutral100opac20,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
