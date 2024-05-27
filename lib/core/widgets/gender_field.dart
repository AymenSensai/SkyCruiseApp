import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';
import '../utils/assets.dart';

class GenderField extends StatefulWidget {
  const GenderField({
    super.key,
    required this.gender,
    required this.onGenderChanged,
  });

  final bool? gender;
  final Function(bool) onGenderChanged;

  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {
  late bool? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyles.font18Primary900Medium,
        ),
        verticalSpace(16),
        DropdownButtonFormField<String>(
          hint: Text(
            'Gender',
            style: TextStyles.font16Neutral200Regular,
          ),
          value: _selectedGender == false
              ? 'Male'
              : _selectedGender == true
                  ? 'Female'
                  : null,
          icon: SvgPicture.asset(
            Assets.arrowDownward,
            colorFilter: const ColorFilter.mode(
                ColorsManager.neutral900, BlendMode.srcIn),
          ),
          items: <String>['Male', 'Female']
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedGender = value == 'Male' ? false : true;
              widget.onGenderChanged(_selectedGender!);
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorsManager.neutral100opac20,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
