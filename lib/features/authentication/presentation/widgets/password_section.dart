import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class PasswordSection extends StatefulWidget {
  const PasswordSection({
    super.key,
    required this.passwordController,
    required this.text,
    this.otherText,
    this.useValidators = true,
  });

  final TextEditingController passwordController;
  final String text;
  final bool useValidators;
  final String? otherText;

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
          prefixIcon: Assets.password,
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
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password.';
            }
            if (widget.otherText != null && value != widget.otherText) {
              return 'The passwords doesn\'t match.';
            }
            if (widget.useValidators) {
              return AppRegex.passwordValidator(value);
            }
          },
        ),
      ],
    );
  }
}
