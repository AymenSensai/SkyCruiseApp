import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_cruise/features/profile/domain/entities/user.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/spacing.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails(
      {super.key, required this.user, required this.onProfileChange});

  final UserEntity? user;
  final VoidCallback onProfileChange;

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral100, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.contact),
              horizontalSpace(8),
              Text(
                'Contact Details',
                style: TextStyles.font14Neutral900Medium,
              ),
              const Spacer(),
              IconButton(
                onPressed: () => widget.onProfileChange(),
                icon: SvgPicture.asset(Assets.edit),
              )
            ],
          ),
          Divider(thickness: 0.5, endIndent: 16.w),
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.only(right: 16.w, bottom: 16.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name', style: TextStyles.font14Neutral900Medium),
                    Text(
                      widget.user?.username ?? '-',
                      style: TextStyles.font14Neutral900Medium,
                    ),
                  ],
                ),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phone number',
                        style: TextStyles.font14Neutral900Medium),
                    Text(
                      widget.user?.phoneNumber ?? '-',
                      style: TextStyles.font14Neutral900Medium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
