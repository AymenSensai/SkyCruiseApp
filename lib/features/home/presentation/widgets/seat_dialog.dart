import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dialog_action_buttons_row.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SeatDialog extends StatefulWidget {
  const SeatDialog({super.key, required this.onSeatClassChanged});

  final VoidCallback onSeatClassChanged;

  @override
  State<SeatDialog> createState() => _SeatDialogState();
}

class _SeatDialogState extends State<SeatDialog> {
  int? selectedSeat = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Seat Class',
            style: TextStyles.font20Neutral900Bold,
          ),
          verticalSpace(8),
          const Divider(),
          verticalSpace(16),
          _buildSeatOption(value: 0, text: 'Economy'),
          verticalSpace(24),
          _buildSeatOption(value: 1, text: 'Premium Economy'),
          verticalSpace(24),
          _buildSeatOption(value: 2, text: 'Business'),
          verticalSpace(24),
          _buildSeatOption(value: 3, text: 'First Class'),
          verticalSpace(24),
          ActionButtonsRow(
            onValueChanged: () => widget.onSeatClassChanged(),
          ),
        ],
      ),
    );
  }

  Widget _buildSeatOption({required int value, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyles.font14Neutral900Medium),
        SizedBox(
          height: 20,
          width: 20,
          child: Radio<int>(
            value: value,
            fillColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.selected)
                    ? ColorsManager.primary500
                    : ColorsManager.primary300),
            groupValue: selectedSeat,
            toggleable: true,
            onChanged: (int? value) => setState(() => selectedSeat = value),
          ),
        ),
      ],
    );
  }
}
