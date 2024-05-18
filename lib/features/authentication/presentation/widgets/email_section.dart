import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
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
      prefixIcon: Assets.email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!AppRegex.isEmailValid(value)) {
          return 'Please enter a valid email';
        }
      },
    );
  }
}
