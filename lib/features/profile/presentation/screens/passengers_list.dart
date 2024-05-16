import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_button.dart';

class PassengersListScreen extends StatelessWidget {
  const PassengersListScreen({super.key});

  static const passengers = [
    'Mr. Benjamin Thompson',
    'Mrs. Sophia Rodriguez',
    'Mr. David Lee',
    'Mrs. Emily Chen',
    'Mr. Daniel Johnson',
    'Mrs. Rachel Patel',
    'Mr. Michael Nguyen',
    'Mrs. Lauren Smith',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 12.w,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _passenger(index, passengers[index]);
                  },
                  childCount: passengers.length,
                ),
              ),
              SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _saveChangesButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BackCenteredTitleAppBar _appBar(BuildContext context) {
    return BackCenteredTitleAppBar(
      title: 'Passengers List',
      action: [
        IconButton(
          onPressed: () => context.pushNamed(Routes.passenger),
          icon: const Icon(
            Icons.add_rounded,
            color: ColorsManager.neutral50,
          ),
        ),
      ],
    );
  }

  Widget _passenger(int index, String name) {
    return Row(
      children: [
        Text(
          '${index + 1}.',
          style: TextStyles.font16Neutral900Medium,
        ),
        horizontalSpace(8),
        Text(
          name,
          style: TextStyles.font16Neutral900Medium,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.edit),
        )
      ],
    );
  }

  Widget _saveChangesButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: AppTextButton(
        buttonText: 'Save Changes',
        onPressed: () {},
      ),
    );
  }
}
