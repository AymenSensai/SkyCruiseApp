import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../controllers/flight_cubit.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({super.key});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeatScreen> {
  List<String> generateSeatNumbers() {
    List<String> seats = [];
    for (int i = 1; i <= 8; i++) {
      seats.add('A$i');
      seats.add('B$i');
      seats.add('C$i');
      seats.add('D$i');
    }
    return seats;
  }

  List<String> selectedSeats = [];

  Widget _buildPassengerWidgets(
      int numberOfPassengers, List<String> passengers) {
    List<Widget> passengerWidgets = [];
    for (int i = 1; i <= numberOfPassengers; i++) {
      passengerWidgets.add(_passenger(i, passengers));
    }
    return Row(children: passengerWidgets);
  }

  @override
  void initState() {
    super.initState();
    selectedSeats = context.read<FlightCubit>().savedSeats;
  }

  @override
  Widget build(BuildContext context) {
    List<String> seats = generateSeatNumbers();
    final numberOfPassengers = context.read<FlightCubit>().numberOfPassengers!;
    final passengers = context.read<FlightCubit>().selectedPassengers;

    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Select Seat'),
      body: Column(
        children: [
          Container(
            height: 80.h,
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            decoration: const BoxDecoration(color: ColorsManager.primary500),
            child: Row(
              children: [
                _buildPassengerWidgets(numberOfPassengers, passengers),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: ColorsManager.neutral50,
                surfaceTintColor: ColorsManager.neutral50,
                elevation: 5,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 16.h),
                  child: Column(
                    children: [
                      const SeatInfoRow(),
                      verticalSpace(16),
                      Expanded(
                        child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: seats.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 16.0,
                          ),
                          itemBuilder: (context, index) {
                            return SeatBox(
                              seatNumber: seats[index],
                              seatSelected: (seat) {
                                if (selectedSeats.length >=
                                    numberOfPassengers) {
                                  selectedSeats = [];
                                }
                                setState(() {
                                  if (selectedSeats.contains(seat)) {
                                    selectedSeats.remove(seat);
                                  } else {
                                    selectedSeats.add(seat);
                                  }
                                });
                              },
                              selectedSeats: selectedSeats,
                              isAvailable: !context
                                  .read<FlightCubit>()
                                  .seatsReserved
                                  .any((e) => e.seatNumber == seats[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
            child: _saveSeats(),
          )
        ],
      ),
    );
  }

  Widget _passenger(int index, List<String> passengers) {
    final passengerName = passengers.length > index - 1
        ? passengers[index - 1]
        : 'Passenger $index';

    return Container(
      height: 48,
      margin: EdgeInsets.only(right: 16.w),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManager.neutral50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 32,
            width: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.primary500,
            ),
            child: Text(
              index.toString(),
              style: TextStyles.font16Neutral50Medium,
            ),
          ),
          horizontalSpace(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                passengerName,
                style: TextStyles.font12Neutral900Medium,
              ),
              Text(
                selectedSeats.length >= index ? selectedSeats[index - 1] : '-',
                style: TextStyles.font12Neutral900Medium,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _saveSeats() {
    return AppTextButton(
      buttonText: 'Save Seats',
      onPressed: () {
        context.read<FlightCubit>().saveSeats(selectedSeats);
        context.pop();
      },
    );
  }
}

class SeatInfoRow extends StatelessWidget {
  const SeatInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSeatInfo(ColorsManager.primary500, 'Selected'),
        _buildSeatInfo(ColorsManager.primary50, 'Occupied'),
        _buildSeatInfo(null, 'Available', isBordered: true),
      ],
    );
  }

  Widget _buildSeatInfo(Color? color, String text, {bool isBordered = false}) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
            border:
                isBordered ? Border.all(color: ColorsManager.neutral300) : null,
          ),
        ),
        horizontalSpace(8),
        Text(
          text,
          style: TextStyles.font12Neutral900Regular,
        ),
      ],
    );
  }
}

class SeatBox extends StatefulWidget {
  final String seatNumber;
  final Function(String) seatSelected;
  final List<String> selectedSeats;
  final bool isAvailable;

  const SeatBox({
    super.key,
    required this.seatNumber,
    required this.seatSelected,
    required this.selectedSeats,
    required this.isAvailable,
  });

  @override
  State<SeatBox> createState() => _SeatBoxState();
}

class _SeatBoxState extends State<SeatBox> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.selectedSeats.contains(widget.seatNumber);
    return GestureDetector(
      onTap: () {
        if (widget.isAvailable) {
          widget.seatSelected(widget.seatNumber);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: !widget.isAvailable
                ? ColorsManager.primary50
                : isSelected
                    ? ColorsManager.primary500
                    : null,
            borderRadius: BorderRadius.circular(8.0),
            border: !widget.isAvailable
                ? null
                : isSelected
                    ? null
                    : Border.all(color: ColorsManager.neutral300),
          ),
          child: Text(
            widget.seatNumber,
            style: !widget.isAvailable
                ? TextStyles.font16Neutral900Medium
                : isSelected
                    ? TextStyles.font16Neutral50Medium
                    : TextStyles.font16Neutral900Medium,
          ),
        ),
      ),
    );
  }
}
