import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyles.font18Primary900Medium,
        ),
        verticalSpace(16),
        EmailTextField(emailController: emailController)
      ],
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: emailController,
      hintText: 'Email',
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 20.h,
        ),
        child: SvgPicture.asset(
          Assets.email,
          colorFilter: const ColorFilter.mode(
            ColorsManager.neutral200,
            BlendMode.srcIn,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
          return 'Please enter a valid email';
        }
      },
    );
  }
}
