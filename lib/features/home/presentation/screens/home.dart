import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/time_formating.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../domain/entities/airport.dart';
import '../widgets/date_dialog.dart';
import '../widgets/passengers_dialog.dart';
import '../widgets/seat_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AirportEntity? departureAirport;
  AirportEntity? arrivalAirport;
  String departureDate = '2024-06-01';
  String? arrivalDate;
  String seatClass = 'Economy';
  int numberOfPassengers = 1;
  late TabController _tabController;
  int _selectedTabIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 1;
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _selectedTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  Future<AirportEntity?> _navigateAndReturnAirport(
      BuildContext context, String argument) async {
    final result =
        await context.pushNamed(Routes.airportSearch, arguments: argument);
    if (!context.mounted) return null;

    return result as AirportEntity;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            width: width,
            height: height / 4,
            child: Container(
              color: ColorsManager.primary500,
            ),
          ),
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
                          '${departureAirport?.cityName ?? 'Washington, D.C.'} (${departureAirport?.code ?? 'IAD'})',
                          () async {
                            final result = await _navigateAndReturnAirport(
                                context, 'Select Origin');
                            setState(() {
                              departureAirport = result!;
                            });
                          },
                        ),
                        Column(
                          children: [
                            verticalSpace(24),
                            _field(
                              'To',
                              SvgPicture.asset(Assets.airplaneDown),
                              '${arrivalAirport?.cityName ?? 'Tokyo'} (${arrivalAirport?.code ?? 'HND'})',
                              () async {
                                final result = await _navigateAndReturnAirport(
                                    context, 'Select Destination');
                                setState(() {
                                  arrivalAirport = result!;
                                });
                              },
                            )
                          ],
                        ),
                        verticalSpace(24),
                        _field(
                          'Date',
                          SvgPicture.asset(Assets.calendar),
                          formatDateWithDay(departureDate),
                          () => showModalBottomSheet(
                            context: context,
                            backgroundColor: ColorsManager.whiteBackground,
                            builder: (context) => DateDialog(
                              singleSelection:
                                  _selectedTabIndex == 0 ? true : false,
                              onPassengersChanged: (dates) {
                                setState(() {
                                  departureDate =
                                      DateFormat('yyyy-MM-dd').format(dates[0]);

                                  if (_selectedTabIndex != 0) {
                                    arrivalDate = DateFormat('yyyy-MM-dd')
                                        .format(dates[1]);
                                  }
                                });
                              },
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
                                '$numberOfPassengers Seat',
                                () => showModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                      ColorsManager.whiteBackground,
                                  builder: (context) => PassengersDialog(
                                    onPassengersChanged: (number) {
                                      setState(() {
                                        numberOfPassengers = number;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpace(16),
                            Expanded(
                              child: _field(
                                'Class',
                                SvgPicture.asset(Assets.classIcon),
                                seatClass,
                                () => showModalBottomSheet(
                                  context: context,
                                  backgroundColor:
                                      ColorsManager.whiteBackground,
                                  builder: (context) => SeatDialog(
                                    onSeatClassChanged: (newClass) {
                                      setState(() {
                                        seatClass = newClass;
                                      });
                                    },
                                    seat: seatClass,
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
        controller: _tabController,
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
      onPressed: () => context.pushNamed(Routes.search, arguments: [
        departureAirport?.code ?? 'IAD',
        arrivalAirport?.code,
        departureDate,
        arrivalDate,
        numberOfPassengers,
        seatClass
      ]),
    );
  }
}
