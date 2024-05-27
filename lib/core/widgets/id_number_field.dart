import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'info_field.dart';

class IdNumberField extends StatelessWidget {
  const IdNumberField({super.key, required this.idController});

  final TextEditingController idController;

  @override
  Widget build(BuildContext context) {
    return InfoField(
      controller: idController,
      text: 'ID number',
      inputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(15),
        CardNumberFormatter(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter passenger id number';
        }
      },
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue; // No change if cursor is at the beginning
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < newValue.text.length; i++) {
      bufferString.write(newValue.text[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 &&
          nonZeroIndexValue != newValue.text.length) {
        bufferString.write('-');
      }
    }

    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
