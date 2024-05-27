import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/time_formating.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/date_field.dart';
import '../../../../core/widgets/gender_field.dart';
import '../../../../core/widgets/info_field.dart';
import '../../domain/entities/user.dart';
import '../controllers/profile_cubit.dart';
import '../controllers/profile_state.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key, this.user});

  final UserEntity? user;
  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  bool _gender = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = widget.user;
    if (user != null) {
      _nameController.text = user.username ?? '';
      _emailController.text = user.email ?? '';
      _phoneNumberController.text = user.phoneNumber ?? '';
      _dateController.text = user.dateOfBirth ?? '';
      _gender = user.gender ?? false;
    } else {
      BlocProvider.of<ProfileCubit>(context).getProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Personal Info'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => current is ProfileSuccess,
            builder: (context, state) {
              return state.maybeWhen(
                profileSuccess: (data) {
                  final user = data as UserEntity;
                  _nameController.text = user.username ?? '';
                  _emailController.text = user.email ?? '';
                  _phoneNumberController.text = user.phoneNumber ?? '';
                  _dateController.text =
                      user.formatDateString(user.dateOfBirth);
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InfoField(
                          controller: _nameController,
                          text: 'Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                          },
                        ),
                        InfoField(
                          controller: _emailController,
                          text: 'Email',
                          inputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!AppRegex.isEmailValid(value)) {
                              return 'Please enter a valid email';
                            }
                          },
                        ),
                        InfoField(
                          controller: _phoneNumberController,
                          text: 'Phone Number',
                          inputType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                          },
                        ),
                        DateField(dateController: _dateController),
                        verticalSpace(12),
                        GenderField(
                          gender: _gender,
                          onGenderChanged: (newGender) => _gender = newGender,
                        ),
                        verticalSpace(24),
                        _saveChangesButton()
                      ],
                    ),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      )),
    );
  }

  Widget _saveChangesButton() {
    return AppTextButton(
      buttonText: 'Save Changes',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final user = UserEntity(
              username: _nameController.text,
              email: _emailController.text,
              phoneNumber: _phoneNumberController.text,
              dateOfBirth:
                  formatDate(_dateController.text).toString().substring(0, 10),
              gender: _gender);
          context.read<ProfileCubit>().modifyProfile(user);
          Navigator.pop(context, user);
        }
      },
    );
  }
}
