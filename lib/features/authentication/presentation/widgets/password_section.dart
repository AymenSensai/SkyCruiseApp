import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class PasswordSection extends StatefulWidget {
  const PasswordSection({
    super.key,
    required this.passwordController,
    required this.text,
  });

  final TextEditingController passwordController;
  final String text;
  @override
  State<PasswordSection> createState() => _PasswordSectionState();
}

class _PasswordSectionState extends State<PasswordSection> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyles.font18Primary900Medium,
        ),
        verticalSpace(16),
        AppTextField(
          controller: widget.passwordController,
          isObscureText: isObscureText,
          hintText: 'Password',
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            child: SvgPicture.asset(Assets.password),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            child: Icon(
              isObscureText ? Icons.visibility_off : Icons.visibility,
              color: ColorsManager.neutral200,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid password';
            }
          },
        ),
      ],
    );
  }
}
