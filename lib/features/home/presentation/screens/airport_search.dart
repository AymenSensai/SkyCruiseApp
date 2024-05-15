import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class AirportSearchScreen extends StatelessWidget {
  const AirportSearchScreen({super.key, required this.title});

  final String title;

  static const List<Airport> airports = [
    Airport(
      name: 'John F. Kennedy International Airport',
      code: 'JFK',
      city: 'New York',
      country: 'United States',
    ),
    Airport(
      name: 'Charles de Gaulle Airport',
      code: 'CDG',
      city: 'Paris',
      country: 'France',
    ),
    Airport(
      name: 'Narita International Airport',
      code: 'NRT',
      city: 'Tokyo',
      country: 'Japan',
    ),
    Airport(
      name: 'London Heathrow Airport',
      code: 'LHR',
      city: 'London',
      country: 'United Kingdom',
    ),
    Airport(
      name: 'Leonardo da Vinci-Flumicino Airport',
      code: 'FCO',
      city: 'Rome',
      country: 'Italy',
    ),
    Airport(
      name: 'Suvarnabhumi Airport',
      code: 'BKK',
      city: 'Bangkok',
      country: 'Thailand',
    ),
    Airport(
      name: 'Dubai International Airport',
      code: 'DXB',
      city: 'Dubai',
      country: 'United Arab Emirates',
    ),
    Airport(
      name: 'Amsterdam Airport Schiphol',
      code: 'AMS',
      city: 'Amsterdam',
      country: 'Netherlands',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloseCenteredTitleAppBar(
        title: title,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              AppTextField(
                hintText: 'Search city or airport',
                validator: (_) {},
                prefixIcon: Assets.search,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 24.w),
                itemBuilder: (context, index) {
                  final airport = airports[index];
                  return Row(
                    children: [
                      SvgPicture.asset(Assets.logo),
                      horizontalSpace(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${airport.city}, ${airport.country}',
                            style: TextStyles.font14Neutral900Medium,
                          ),
                          Text(
                            '${airport.code} - ${airport.name}',
                            style: TextStyles.font12Neutral700Regular,
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: ColorsManager.neutral900,
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(height: 32),
                itemCount: airports.length,
              )
            ],
          ),
        ),
      )),
    );
  }
}

class Airport {
  final String name;
  final String code;
  final String city;
  final String country;

  const Airport({
    required this.name,
    required this.code,
    required this.city,
    required this.country,
  });
}
