import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/date_dialog.dart';
import '../widgets/passengers_dialog.dart';
import '../widgets/seat_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
          child: Stack(
        children: [
          // Blue background behind search fields
          Positioned(
            width: width,
            height: height / 4,
            child: Container(
              color: ColorsManager.primary500,
            ),
          ),

          // Search fields with white background
          Positioned(
            right: 24,
            left: 24,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorsManager.neutral50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        color: Colors.black.withOpacity(0.11),
                        blurRadius: 24)
                  ]),
              child: Column(
                children: [
                  _tabBar(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    child: Column(
                      children: [
                        _field(
                          'From',
                          SvgPicture.asset(Assets.airplaneUp),
                          'New York (JFK)',
                          () => context.pushNamed(Routes.airportSearch,
                              arguments: 'Select Origin'),
                        ),
                        verticalSpace(24),
                        _field(
                          'To',
                          SvgPicture.asset(Assets.airplaneDown),
                          'Paris (CDG)',
                          () => context.pushNamed(Routes.airportSearch,
                              arguments: 'Select Destination'),
                        ),
                        verticalSpace(24),
                        _field(
                          'Date',
                          SvgPicture.asset(Assets.calendar),
                          'Wednesday, Dec 27 2023',
                          () => showModalBottomSheet(
                            context: context,
                            backgroundColor: ColorsManager.whiteBackground,
                            builder: (context) => DateDialog(
                              onPassengersChanged: () {},
                            ),
                          ),
                        ),
                        verticalSpace(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: _field(
                                'Passengers',
                                SvgPicture.asset(Assets.passengers),
                                '1 Seat',
                                () => showModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                      ColorsManager.whiteBackground,
                                  builder: (context) => PassengersDialog(
                                    onPassengersChanged: () {},
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpace(16),
                            Expanded(
                              child: _field(
                                'Class',
                                SvgPicture.asset(Assets.classIcon),
                                'Economy',
                                () => showModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                      ColorsManager.whiteBackground,
                                  builder: (context) => SeatDialog(
                                    onSeatClassChanged: () {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(24),
                        _searchButton(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text('Home'),
      actions: [
        GestureDetector(
          onTap: () => context.pushNamed(Routes.notification),
          child: Container(
            height: 32,
            width: 32,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorsManager.primary400,
            ),
            child: SvgPicture.asset(
              Assets.notification,
              width: 18,
              height: 18,
              fit: BoxFit.scaleDown,
            ),
          ),
        )
      ],
    );
  }

  Widget _tabBar() {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        labelColor: ColorsManager.primary500,
        unselectedLabelColor: ColorsManager.neutral600,
        indicatorColor: ColorsManager.primary500,
        labelPadding: EdgeInsets.only(left: 8.w, right: 8.w),
        dividerHeight: 0,
        tabs: const [
          Tab(text: 'One Way'),
          Tab(text: 'Round Trip'),
          Tab(text: 'Multi City'),
        ],
      ),
    );
  }

  Widget _field(
      String title, SvgPicture icon, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral200),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.font12Neutral500Regular,
            ),
            verticalSpace(4),
            Row(
              children: [
                icon,
                horizontalSpace(8),
                Text(
                  value,
                  style: TextStyles.font14Neutral900Medium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _searchButton(BuildContext context) {
    return AppTextButton(
      buttonText: 'Search flight',
      onPressed: () => context.pushNamed(Routes.search),
    );
  }
}
