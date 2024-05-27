import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Payment Method'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            children: [
              // InfoField(
              //   controller: _nameController,
              //   text: 'Cardholder’s name',
              //   validator: (value) {
              //               if (value == null || value.isEmpty) {
              //                 return 'Please enter your name';
              //               }
              //             },
              // ),
              // InfoField(
              //   controller: _numberController,
              //   text: 'Card number',
              //   inputType: TextInputType.number,
              //   inputFormatters: [
              //     FilteringTextInputFormatter.digitsOnly,
              //     LengthLimitingTextInputFormatter(16),
              //   ],
              // ),
              // InfoField(
              //   controller: _dateController,
              //   text: 'Expiration date',
              //   inputType: TextInputType.number,
              //   inputFormatters: [
              //     LengthLimitingTextInputFormatter(4),
              //   ],
              // ),
              // InfoField(
              //   controller: _cvvController,
              //   text: 'CVV',
              //   inputType: TextInputType.number,
              //   inputFormatters: [
              //     LengthLimitingTextInputFormatter(3),
              //   ],
              // ),
              // verticalSpace(24),
              // _addPassengerButton()
            ],
          ),
        ),
      )),
    );
  }

  Widget _addPassengerButton() {
    return AppTextButton(
      buttonText: 'Save card',
      onPressed: () {},
    );
  }
}
