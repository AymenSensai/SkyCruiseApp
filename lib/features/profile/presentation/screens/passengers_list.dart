import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_bar.dart';

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
      appBar: _appBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 12),
          child: Column(
            children: [_passengersBuilder()],
          ),
        ),
      )),
    );
  }

  BackCenteredTitleAppBar _appBar() {
    return BackCenteredTitleAppBar(
      title: 'Passengers List',
      action: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.add_rounded,
          color: ColorsManager.neutral50,
        ),
      ),
    );
  }

  Widget _passengersBuilder() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox.shrink(),
      itemCount: passengers.length,
      itemBuilder: (context, index) {
        final passenger = passengers[index];
        return _passenger(index, passenger);
      },
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
}
