import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'dialog_action_buttons_row.dart';

class PassengersDialog extends StatefulWidget {
  const PassengersDialog({super.key, required this.onPassengersChanged});

  final VoidCallback onPassengersChanged;

  @override
  State<PassengersDialog> createState() => _PassengersDialogState();
}

class _PassengersDialogState extends State<PassengersDialog> {
  int adultsNumber = 1;
  int childrenNumber = 0;
  int infantsNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Passengers',
            style: TextStyles.font20Neutral900Bold,
          ),
          verticalSpace(8),
          const Divider(),
          verticalSpace(16),
          _buildPassenger('Adults', 'Over 17', adultsNumber, (value) {
            setState(() {
              adultsNumber += value;
            });
          }),
          verticalSpace(24),
          _buildPassenger('Children', '2-17', childrenNumber, (value) {
            setState(() {
              childrenNumber += value;
            });
          }),
          verticalSpace(24),
          _buildPassenger('Infants', 'Under 2', infantsNumber, (value) {
            setState(() {
              infantsNumber += value;
            });
          }),
          verticalSpace(24),
          ActionButtonsRow(
            onValueChanged: () => widget.onPassengersChanged(),
          ),
        ],
      ),
    );
  }

  Widget _buildPassenger(
      String title, String age, int number, Function(int) onNumberChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyles.font14Neutral900Medium),
            Text(age, style: TextStyles.font12Neutral900Light),
          ],
        ),
        _passengerNumber(
          title,
          number,
          onNumberChanged,
        )
      ],
    );
  }

  Widget _passengerNumber(
      String title, int number, Function(int) onNumberChanged) {
    return Row(children: [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: onMinusActionPressColor(title, number)
              ? ColorsManager.primary500
              : ColorsManager.neutral300,
          borderRadius: BorderRadius.circular(50),
        ),
        child: GestureDetector(
          onTap: () => onMinusActionPressState(title, number)
              ? onNumberChanged(-1)
              : null,
          child: const Icon(
            Icons.remove,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
      horizontalSpace(12),
      SizedBox(
          width: 20.w,
          child: Center(
            child: Text(number.toString(),
                style: TextStyles.font14Neutral900Medium),
          )),
      horizontalSpace(12),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: onPlusActionPressColor(title, number)
              ? ColorsManager.primary500
              : ColorsManager.neutral300,
          borderRadius: BorderRadius.circular(50),
        ),
        child: GestureDetector(
          onTap: () =>
              onPlusActionPressState(title, number) ? onNumberChanged(1) : null,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 16,
          ),
        ),
      )
    ]);
  }

  bool onMinusActionPressState(String title, int number) {
    if ((infantsNumber == adultsNumber) && (title == 'Adults')) {
      _showToast(
          'Number of infants in lap may not be higher than number of adults');
      return false;
    }
    if ((title == 'Adults' && number > 1) ||
        (title != 'Adults' && number > 0)) {
      return true;
    }
    return false;
  }

  bool onMinusActionPressColor(String title, int number) {
    if ((infantsNumber == adultsNumber) && (title == 'Adults')) {
      return false;
    }
    if ((title == 'Adults' && number > 1) ||
        (title != 'Adults' && number > 0)) {
      return true;
    }
    return false;
  }

  bool onPlusActionPressColor(String title, int number) {
    if ((adultsNumber + childrenNumber + infantsNumber) == 9) {
      return false;
    } else if ((infantsNumber == adultsNumber) && (title == 'Infants')) {
      return false;
    }
    return true;
  }

  bool onPlusActionPressState(String title, int number) {
    if ((adultsNumber + childrenNumber + infantsNumber) == 9) {
      _showToast('You may search for up to 9 passengers at a time');
      return false;
    } else if ((infantsNumber == adultsNumber) && (title == 'Infants')) {
      _showToast(
          'Number of infants in lap may not be higher than number of adults');
      return false;
    }
    return true;
  }

  void _showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorsManager.error500,
      textColor: ColorsManager.neutral50,
      fontSize: 16.0,
    );
  }
}
