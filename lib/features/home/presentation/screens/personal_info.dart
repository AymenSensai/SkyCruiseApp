import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';
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
  DateTime _selectedDate = DateTime.now();

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
              InfoField(
                controller: _dateController,
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
              ),
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
        _dateController.text = DateFormat.yMMMd().format(_selectedDate);
      });
    }
  }

  Widget _saveChangesButton() {
    return AppTextButton(
      buttonText: 'Save Changes',
      onPressed: () {},
    );
  }
}
