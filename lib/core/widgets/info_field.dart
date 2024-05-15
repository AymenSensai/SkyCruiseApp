import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/styles.dart';
import 'app_text_form_field.dart';

class InfoField extends StatelessWidget {
  const InfoField({
    super.key,
    required this.controller,
    required this.text,
    this.inputType,
    this.suffixIcon,
    this.readOnly,
    this.focusedBorder,
  });

  final TextEditingController controller;
  final String text;
  final TextInputType? inputType;
  final Widget? suffixIcon;
  final bool? readOnly;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyles.font18Primary900Medium,
          ),
          verticalSpace(16),
          AppTextField(
            controller: controller,
            hintText: text,
            keyboardType: inputType,
            suffixIcon: suffixIcon,
            readOnly: readOnly,
            focusedBorder: focusedBorder,
            validator: (value) {
              // if (value == null || value.isEmpty) {
              //   return 'Please enter a your name';
              // }
            },
          )
        ],
      ),
    );
  }
}
