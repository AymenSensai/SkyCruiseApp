import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/flight.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const List<String> filters = [
    'Best',
    'Cheapest',
    'Fastest',
    'Direct',
    'All filters',
  ];

  int selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Trips'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Flights to Dubai',
                  style: TextStyles.font18Neutral900Bold,
                ),
              ),
              verticalSpace(16),
              _filtersBuilder(),
              verticalSpace(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const Column(
                  children: [
                    Flight(),
                    Flight(),
                    Flight(),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget _filtersBuilder() {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        separatorBuilder: (context, index) => horizontalSpace(16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = index == selectedFilter;
          return filterView(filter, isSelected, () {
            setState(() {
              selectedFilter = index;
            });
          });
        },
      ),
    );
  }

  Widget filterView(String filter, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: !isSelected
                  ? Border.all(
                      color: ColorsManager.neutral400,
                      width: 1,
                    )
                  : null,
              color: isSelected ? ColorsManager.primary500 : null),
          child: Text(
            filter,
            style: isSelected
                ? TextStyles.font14Neutral50Regular
                : TextStyles.font14Neutral900Regular,
          )),
    );
  }
}
