import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/time_formating.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/date_field.dart';
import '../../../../core/widgets/gender_field.dart';
import '../../../../core/widgets/id_number_field.dart';
import '../../../../core/widgets/info_field.dart';
import '../../domain/entities/passenger.dart';
import '../controllers/profile_cubit.dart';

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
  bool? _gender;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Passenger'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InfoField(
                    controller: _nameController,
                    text: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the passenger name';
                      }
                    },
                  ),
                  GenderField(
                    gender: _gender,
                    onGenderChanged: (newGender) => _gender = newGender,
                  ),
                  DateField(dateController: _dateController),
                  InfoField(
                    controller: _nationalityController,
                    text: 'Nationality',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the passenger nationality';
                      }
                    },
                  ),
                  IdNumberField(idController: _idController),
                  verticalSpace(24),
                  _addPassengerButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _addPassengerButton() {
    return AppTextButton(
      buttonText: 'Add Passenger',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final passenger = PassengerEntity(
            name: _nameController.text,
            idNumber: _idController.text,
            nationality: _nationalityController.text,
            dateOfBirth:
                formatDate(_dateController.text).toString().substring(0, 10),
            gender: _gender,
          );
          context.read<ProfileCubit>().addPassenger(passenger);
          Navigator.pop(context, passenger);
        }
      },
    );
  }
}
