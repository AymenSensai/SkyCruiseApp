import 'package:flutter/material.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class NameSection extends StatelessWidget {
  const NameSection({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: TextStyles.font18Primary900Medium,
        ),
        verticalSpace(16),
        AppTextField(
          controller: nameController,
          hintText: 'Name',
          prefixIcon: Assets.profileSolid,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            } else if (!AppRegex.isUsernameValid(value)) {
              return 'Name can only contain alphanumeric characters.';
            }
          },
        ),
      ],
    );
  }
}
