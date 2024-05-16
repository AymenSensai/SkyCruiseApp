import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/date_field.dart';
import '../../../../core/widgets/gender_field.dart';
import '../../../../core/widgets/info_field.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Personal Info'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            children: [
              InfoField(controller: _nameController, text: 'Name'),
              InfoField(
                controller: _emailController,
                text: 'Email',
                inputType: TextInputType.emailAddress,
              ),
              InfoField(
                controller: _phoneNumberController,
                text: 'Phone Number',
                inputType: TextInputType.phone,
              ),
              DateField(dateController: _dateController),
              verticalSpace(12),
              const GenderField(),
              verticalSpace(24),
              _saveChangesButton()
            ],
          ),
        ),
      )),
    );
  }

  Widget _saveChangesButton() {
    return AppTextButton(
      buttonText: 'Save Changes',
      onPressed: () {},
    );
  }
}
