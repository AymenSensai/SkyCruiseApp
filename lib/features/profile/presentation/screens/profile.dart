import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/shared_prefs.dart';
import '../../../../core/widgets/switch.dart';
import '../controllers/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ProfileCubit>(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              iconAndTextRow(
                Assets.passengersSettings,
                'Passengers List',
                () => context.pushNamed(Routes.passengersList),
              ),
              verticalSpace(12),
              Text(
                'General',
                style: TextStyles.font18Neutral900Medium,
              ),
              verticalSpace(12),
              iconAndTextRow(
                Assets.profileSettings,
                'Personal Info',
                () => context.pushNamed(Routes.personalInfo),
              ),
              iconAndTextRow(
                Assets.notificationSettings,
                'Notifications',
                () => context.pushNamed(Routes.notificationSettings),
              ),
              iconAndTextRow(
                Assets.security,
                'Security',
                () => context.pushNamed(Routes.security),
              ),
              iconAndTextRow(
                Assets.language,
                'Language',
                () => context.pushNamed(Routes.language),
                widget: Row(
                  children: [
                    Text(
                      'English',
                      style: TextStyles.font14Neutral700Medium,
                    ),
                    horizontalSpace(12),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorsManager.neutral900,
                      size: 14,
                    )
                  ],
                ),
              ),
              iconAndTextRow(
                Assets.moon,
                'Dark Mode',
                () {},
                widget: CustomSwitch(
                  onChanged: () {},
                ),
              ),
              verticalSpace(12),
              Text(
                'About',
                style: TextStyles.font18Neutral900Medium,
              ),
              verticalSpace(12),
              iconAndTextRow(Assets.support, 'Help & Support', () {}),
              iconAndTextRow(
                Assets.signOut,
                'Sign out',
                color: ColorsManager.error500,
                () {
                  SharedPreferencesService.saveToken('');
                  context.pushNamedAndRemoveUntil(
                    Routes.signIn,
                    predicate: (Route<dynamic> route) => false,
                  );
                },
                widget: const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget iconAndTextRow(String icon, String text, VoidCallback onTap,
      {Color? color, Widget? widget}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                color ?? ColorsManager.neutral900,
                BlendMode.srcIn,
              ),
            ),
            horizontalSpace(16),
            Text(
              text,
              style: TextStyles.font14Neutral900Medium.copyWith(color: color),
            ),
            const Spacer(),
            widget ??
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ColorsManager.neutral900,
                  size: 14,
                )
          ],
        ),
      ),
    );
  }
}
