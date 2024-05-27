import 'package:flutter/material.dart';
import 'package:sky_cruise/core/utils/spacing.dart';

import '../theming/styles.dart';

void errorSnackbar(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          horizontalSpace(8),
          Expanded(
            child: Text(
              error,
              style: TextStyles.font12Neutral50Medium,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red[600],
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
    ),
  );
}
