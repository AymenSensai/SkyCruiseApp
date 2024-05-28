import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'dialog_action_buttons_row.dart';

class DateDialog extends StatefulWidget {
  const DateDialog(
      {super.key,
      required this.onPassengersChanged,
      this.singleSelection = false});

  final Function(List<DateTime>) onPassengersChanged;
  final bool singleSelection;

  @override
  State<DateDialog> createState() => _DateDialogState();
}

class _DateDialogState extends State<DateDialog> {
  final List<DateTime> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      child: Column(
        children: [
          Text(
            'Select Date',
            style: TextStyles.font20Neutral900Bold,
          ),
          verticalSpace(8),
          const Divider(),
          _calendar(),
          ActionButtonsRow(
            onValueChanged: () => widget.onPassengersChanged(selectedDates),
          ),
        ],
      ),
    );
  }

  Widget _calendar() {
    return TableCalendar(
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(const Duration(days: 356)),
      focusedDay: DateTime.now(),
      calendarStyle: CalendarStyle(
        disabledTextStyle: TextStyles.font12Neutral400Medium,
        defaultTextStyle: TextStyles.font12Neutral900Medium,
        weekendTextStyle: TextStyles.font12Neutral900Medium,
        todayTextStyle: TextStyles.font12Neutral900Medium,
        markerDecoration: const BoxDecoration(
          color: ColorsManager.primary500,
          shape: BoxShape.circle,
        ),
        todayDecoration: const BoxDecoration(),
      ),
      rowHeight: 35.h,
      sixWeekMonthsEnforced: true,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyles.font16Neutral900Medium,
        leftChevronMargin: const EdgeInsets.all(0),
        leftChevronPadding: const EdgeInsets.all(0),
        rightChevronMargin: const EdgeInsets.all(0),
        rightChevronPadding: const EdgeInsets.all(0),
        headerMargin: const EdgeInsets.all(0),
        headerPadding: const EdgeInsets.all(0),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) =>
            DateFormat.E(locale).format(date)[0],
      ),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          if (widget.singleSelection) {
            selectedDates.clear();
            selectedDates.add(selectedDay);
          } else {
            if (selectedDates.length < 2) {
              selectedDates.add(selectedDay);
            } else {
              selectedDates[0] = selectedDay;
              selectedDates.removeLast();
            }
          }
        });
      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          bool isSelected = selectedDates.contains(date);
          bool isBetween = selectedDates.length == 2 &&
              (date.isAfter(selectedDates[0]) &&
                  date.isBefore(selectedDates[1]));

          if (isSelected || isBetween) {
            return Center(
              child: Row(
                children: [
                  if (selectedDates.length == 2 && date == selectedDates[1])
                    Container(
                      height: 23.h,
                      width: 11.w,
                      decoration: const BoxDecoration(
                        color: ColorsManager.primary100,
                      ),
                    ),
                  Stack(
                    children: [
                      if (selectedDates.length == 2 && date == selectedDates[0])
                        Positioned(
                          right: 0,
                          top: 5,
                          child: Center(
                            child: Container(
                              width: 11.w,
                              height: 23.h,
                              color: ColorsManager.primary100,
                            ),
                          ),
                        ),
                      if (selectedDates.length == 2 && date == selectedDates[1])
                        Positioned(
                          left: 0,
                          top: 5,
                          child: Center(
                            child: Container(
                              width: 11.w,
                              height: 23.h,
                              color: ColorsManager.primary100,
                            ),
                          ),
                        ),
                      Container(
                        height: isSelected ? 32 : 23.h,
                        width: isSelected ? 32 : 44.4.w,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorsManager.primary500
                              : ColorsManager.primary100,
                          borderRadius:
                              BorderRadius.circular(isSelected ? 50 : 0),
                        ),
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: isSelected
                                ? TextStyles.font12Neutral50Medium
                                : TextStyles.font12Neutral900Medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (selectedDates.length == 2 && date == selectedDates[0])
                    Container(
                      height: 23.h,
                      width: 11.w,
                      decoration: const BoxDecoration(
                        color: ColorsManager.primary100,
                      ),
                    ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
