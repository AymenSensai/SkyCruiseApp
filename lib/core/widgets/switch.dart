import 'package:flutter/material.dart';

import '../theming/colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, required this.onChanged});

  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 35,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
            activeColor: ColorsManager.primary500,
            inactiveTrackColor: ColorsManager.neutral100,
            trackOutlineColor:
                const MaterialStatePropertyAll(Colors.transparent),
            thumbColor: const MaterialStatePropertyAll(ColorsManager.neutral50),
            value: false,
            onChanged: (value) => onChanged()),
      ),
    );
  }
}
