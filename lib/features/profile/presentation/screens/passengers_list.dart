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
import '../../../../core/widgets/app_bar.dart';
import '../../domain/entities/passenger.dart';
import '../controllers/profile_cubit.dart';
import '../controllers/profile_state.dart';

class PassengersListScreen extends StatefulWidget {
  const PassengersListScreen({super.key});

  @override
  State<PassengersListScreen> createState() => _PassengersListScreenState();
}

class _PassengersListScreenState extends State<PassengersListScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ProfileCubit>(context).getPassengers();
  }

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
          child: BlocBuilder<ProfileCubit, ProfileState>(
            buildWhen: (previous, current) => current is ProfileSuccess,
            builder: (context, state) {
              return state.maybeWhen(
                profileSuccess: (data) {
                  final passengers = data as List<PassengerEntity>;
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _passenger(index, passengers[index].name!);
                          },
                          childCount: passengers.length,
                        ),
                      ),
                    ],
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
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
}
