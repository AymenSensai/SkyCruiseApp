import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/date_field.dart';
import '../../../../core/widgets/gender_field.dart';
import '../../../../core/widgets/id_number_field.dart';
import '../../../../core/widgets/info_field.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({super.key});

  @override
  State<PassengerScreen> createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Passenger'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              children: [
                InfoField(controller: _nameController, text: 'Name'),
                const GenderField(),
                DateField(dateController: _dateController),
                InfoField(
                    controller: _nationalityController, text: 'Nationality'),
                IdNumberField(idController: _idController),
                verticalSpace(24),
                _addPassengerButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addPassengerButton() {
    return AppTextButton(
      buttonText: 'Add Passenger',
      onPressed: () {},
    );
  }
}
