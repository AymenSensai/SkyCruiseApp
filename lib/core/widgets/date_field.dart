import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../theming/colors.dart';
import '../utils/assets.dart';
import 'info_field.dart';

class DateField extends StatefulWidget {
  const DateField({super.key, required this.dateController});
  final TextEditingController dateController;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return InfoField(
      controller: widget.dateController,
      text: 'Date of birth',
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: GestureDetector(
          onTap: () => _selectDate(context),
          child: SvgPicture.asset(
            Assets.calendar,
            colorFilter: const ColorFilter.mode(
              ColorsManager.neutral900,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your date of birth';
        }
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
        widget.dateController.text = DateFormat.yMMMd().format(_selectedDate);
      });
    }
  }
}
