import 'package:flutter/material.dart';
import '../theming/colors.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key, required this.onChecked});

  final Function(bool?) onChecked;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: ColorsManager.primary500,
      onChanged: (value) {
        widget.onChecked(value);
        setState(() {
          isChecked = value;
        });
      },
    );
  }
}
