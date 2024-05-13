import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/time_formating.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static List<Notification> notifications = [
    Notification(
      title: 'Exclusive Offer Unlocked!',
      content:
          "Exclusive offer alert! Get 20% off on your next flight booking with our limited-time promotion. Don't miss out!",
      date: DateTime.now(),
      seen: true,
      icon: Assets.carbonSecurity,
      state: NotificationState.successful,
    ),
    Notification(
      title: 'Two-Factor Authentication',
      content:
          "Boost your account security! Enable 2FA now for added protection. It's quick, easy, and keeps your data safe. Act now!",
      date: DateTime.now(),
      seen: false,
      icon: Assets.badge,
      state: NotificationState.random,
    ),
    Notification(
      title: 'New Feature Alert',
      content:
          "Exciting news! We've just rolled out a new feature that allows you to track your flight in real-time. Stay updated on your journey's progress effortlessly.",
      date: DateTime.now(),
      seen: true,
      icon: Assets.ringBell,
      state: NotificationState.successful,
    ),
    Notification(
      title: 'Payment Canceled',
      content:
          "We regret to inform you that the payment for your flight to Rome has been canceled due to an issue with your payment method.",
      date: DateTime.now(),
      seen: true,
      icon: Assets.calendarRemove,
      state: NotificationState.failed,
    ),
    Notification(
      title: 'Payment Successful!',
      content:
          "Successful ticket payment for 06 April 2024 with Qatar airways.",
      date: DateTime.now(),
      seen: false,
      icon: Assets.wallet,
      state: NotificationState.successful,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CloseCenteredTitleAppBar(title: 'Notification'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today',
                      style: TextStyles.font12Neutral400Medium,
                    ),
                    Text(
                      'Mark all as read',
                      style: TextStyles.font12Primary500Regular,
                    ),
                  ],
                ),
              ),
              _notificationsBuilder()
            ],
          ),
        ),
      )),
    );
  }

  Widget _notificationsBuilder() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 24.w),
      separatorBuilder: (context, index) => const SizedBox.shrink(),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationView(
          icon: notification.icon,
          title: notification.title,
          content: notification.content,
          date: notification.date,
          seen: notification.seen,
          state: notification.state,
        );
      },
    );
  }
}

class NotificationView extends StatelessWidget {
  const NotificationView({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.date,
    required this.seen,
    required this.state,
  });

  final String icon;
  final String title;
  final String content;
  final DateTime date;
  final bool seen;
  final NotificationState state;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: seen
          ? ColorsManager.neutral50
          : ColorsManager.primary50.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: state == NotificationState.successful
                  ? ColorsManager.success50
                  : state == NotificationState.random
                      ? ColorsManager.primary50
                      : ColorsManager.error50,
            ),
            child: SvgPicture.asset(icon,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  state == NotificationState.successful
                      ? ColorsManager.success600
                      : state == NotificationState.random
                          ? ColorsManager.primary500
                          : ColorsManager.error500,
                  BlendMode.srcIn,
                )),
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.font14Neutral900Semibold,
              ),
              verticalSpace(2),
              SizedBox(
                width: width - 130.w,
                child: Text(
                  content,
                  style:
                      TextStyles.font12Neutral500Regular.copyWith(height: 1.6),
                ),
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                formatElapsedTime(date),
                style: TextStyles.font10Neutral500Regular,
              ),
              seen
                  ? const SizedBox.shrink()
                  : Container(
                      height: 8,
                      width: 8,
                      margin: EdgeInsets.only(top: 12.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorsManager.error500,
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}

class Notification {
  final String title;
  final String content;
  final DateTime date;
  final bool seen;
  final String icon;
  final NotificationState state;

  Notification({
    required this.title,
    required this.content,
    required this.date,
    required this.seen,
    required this.icon,
    required this.state,
  });
}

enum NotificationState { successful, failed, random }
