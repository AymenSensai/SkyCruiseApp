import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/switch.dart';

import '../../../../core/widgets/app_bar.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(
        title: 'Notification',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            children: [
              notificationRow('Exclusive Offers'),
              notificationRow('Flight Updates'),
              notificationRow('Payment Updates'),
              notificationRow('Refunds and cancellations'),
              notificationRow('App Updates'),
            ],
          ),
        ),
      )),
    );
  }

  Widget notificationRow(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.font16Neutral900Medium,
          ),
          CustomSwitch(
            onChanged: () {},
            isSwitched: true,
          ),
        ],
      ),
    );
  }
}
