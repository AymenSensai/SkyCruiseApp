import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_cruise/core/utils/extensions.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../domain/entities/airport.dart';
import '../controllers/home_cubit.dart';
import '../controllers/home_state.dart';

class AirportSearchScreen extends StatefulWidget {
  const AirportSearchScreen({super.key, required this.title});

  final String title;

  @override
  State<AirportSearchScreen> createState() => _AirportSearchScreenState();
}

class _AirportSearchScreenState extends State<AirportSearchScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<HomeCubit>(context).getAirports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloseCenteredTitleAppBar(
        title: widget.title,
      ),
      body: SafeArea(child: _airportBlocBuilder()),
    );
  }

  Widget _airportBlocBuilder() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeLoading ||
          current is HomeSuccess ||
          current is HomeError,
      builder: (context, state) {
        return state.maybeWhen(
            homeLoading: () {
              return const LinearProgressIndicator(
                  color: ColorsManager.primary500);
            },
            homeSuccess: (response) {
              var airports = response as List<AirportEntity>;
              return _AirportListView(airports: airports);
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }
}

class _AirportListView extends StatefulWidget {
  const _AirportListView({required this.airports});
  final List<AirportEntity> airports;

  @override
  State<_AirportListView> createState() => __AirportListViewState();
}

class __AirportListViewState extends State<_AirportListView> {
  final TextEditingController searchController = TextEditingController();
  late List<AirportEntity> filteredAirports;

  @override
  void initState() {
    super.initState();
    filteredAirports = widget.airports;
    searchController.addListener(_filterAirports);
  }

  void _filterAirports() {
    setState(() {
      final searchText = searchController.text.toLowerCase();
      final filteredList = widget.airports.where((airport) {
        return airport.cityName.toLowerCase().contains(searchText);
      }).toList();
      filteredAirports =
          filteredList.isNotEmpty ? filteredList : widget.airports;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: [
            AppTextField(
              hintText: 'Search city or airport',
              validator: (_) {},
              prefixIcon: Assets.search,
              controller: searchController,
            ),
            _airportsListView(filteredAirports),
          ],
        ),
      ),
    );
  }

  Widget _airportsListView(List<AirportEntity> airports) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 24.h),
      separatorBuilder: (context, index) => const Divider(height: 32),
      itemCount: airports.length,
      itemBuilder: (context, index) {
        final airport = airports[index];
        return _AirportItem(airport: airport);
      },
    );
  }
}

class _AirportItem extends StatelessWidget {
  const _AirportItem({required this.airport});
  final AirportEntity airport;

  @override
  Widget build(BuildContext context) {
    final textAvailableWidth = context.screenWidth() - 120.w;
    return GestureDetector(
      onTap: () => Navigator.pop(context, airport),
      child: Row(
        children: [
          SvgPicture.asset(Assets.logo),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: textAvailableWidth,
                child: Text(
                  '${airport.cityName} - ${airport.countryName}',
                  style: TextStyles.font14Neutral900Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: textAvailableWidth,
                child: Text(
                  '${airport.code} - ${airport.name}',
                  style: TextStyles.font12Neutral700Regular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: ColorsManager.neutral900,
          ),
        ],
      ),
    );
  }
}
