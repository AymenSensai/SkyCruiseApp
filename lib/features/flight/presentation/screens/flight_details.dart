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
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/flight.dart';
import '../widgets/custom_stepper.dart';

class FlightDetailsScreen extends StatefulWidget {
  const FlightDetailsScreen({super.key});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            height: screenHeight * 0.13,
            left: 0,
            right: 0,
            child: Container(
              color: ColorsManager.primary500,
              height: 100.h,
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h),
              child: const CustomStepper(),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  children: [
                    const Flight(),
                    verticalSpace(16),
                    _contactDetails(),
                    verticalSpace(24),
                    _passengerDetails(),
                    verticalSpace(24),
                    _seatNumber(),
                    verticalSpace(24),
                    _facility(),
                    verticalSpace(24),
                    _priceDetails(),
                    verticalSpace(24),
                    _addPassenger()
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  BackCenteredTitleAppBar _appBar() {
    return BackCenteredTitleAppBar(
      title: 'Flight details',
      action: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }

  Widget _contactDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral100, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.contact),
              horizontalSpace(8),
              Text(
                'Contact Details',
                style: TextStyles.font14Neutral900Medium,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => context.pushNamed(Routes.personalInfo),
                child: SvgPicture.asset(Assets.edit),
              )
            ],
          ),
          Divider(
            height: 24.h,
            thickness: 0.5,
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name', style: TextStyles.font14Neutral900Medium),
              Text(
                'Monsieur Nescaffier',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Phone number', style: TextStyles.font14Neutral900Medium),
              Text(
                '+213 | 486841621',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _passengerDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral100, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.contact),
              horizontalSpace(8),
              Text(
                'Passenger(s) Details',
                style: TextStyles.font14Neutral900Medium,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => context.pushNamed(Routes.passenger),
                child: const Icon(
                  Icons.add_rounded,
                  color: ColorsManager.primary500,
                ),
              )
            ],
          ),
          Divider(
            height: 24.h,
            thickness: 0.5,
          ),
          verticalSpace(8),
          AppTextField(
            controller: controller,
            hintText: 'Passenger 1',
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
              child: SvgPicture.asset(Assets.arrowDownward),
            ),
            validator: (value) {},
          ),
          verticalSpace(16),
          AppTextField(
            controller: controller2,
            hintText: 'Passenger 2',
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
              child: SvgPicture.asset(Assets.arrowDownward),
            ),
            validator: (value) {},
          ),
        ],
      ),
    );
  }

  _seatNumber() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral100, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.classIcon,
                colorFilter: const ColorFilter.mode(
                  ColorsManager.neutral900,
                  BlendMode.srcIn,
                ),
              ),
              horizontalSpace(8),
              Text(
                'Seat Number',
                style: TextStyles.font14Neutral900Medium,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 18,
                color: ColorsManager.primary500,
              )
            ],
          ),
        ],
      ),
    );
  }

  _facility() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral100, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.suitcase),
              horizontalSpace(8),
              Text(
                'Facility',
                style: TextStyles.font14Neutral900Medium,
              ),
              const Spacer(),
              const Icon(
                Icons.add_rounded,
                color: ColorsManager.primary500,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _priceDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.neutral100, width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.dollar),
              horizontalSpace(8),
              Text(
                'Price Details',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          Divider(
            height: 24.h,
            thickness: 0.5,
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Da Nang (Adult) x2',
                  style: TextStyles.font14Neutral900Regular),
              Text(
                '\$484.00',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Travel Insurance x2',
                  style: TextStyles.font14Neutral900Regular),
              Text(
                '\$200.00',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax x2', style: TextStyles.font14Neutral900Regular),
              Text(
                '\$50.00',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
          Divider(
            height: 24.h,
            thickness: 0.5,
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Price', style: TextStyles.font14Neutral900Regular),
              Text(
                '\$1,200.00',
                style: TextStyles.font14Neutral900Medium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addPassenger() {
    return AppTextButton(buttonText: 'Add Passenger', onPressed: () {});
  }
}
