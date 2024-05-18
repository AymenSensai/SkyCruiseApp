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

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                children: [
                  _emptyPaymentMethod(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BackCenteredTitleAppBar _appBar(BuildContext context) {
    return BackCenteredTitleAppBar(
      title: 'Payment Methods',
      action: [
        IconButton(
          onPressed: () => context.pushNamed(Routes.paymentMethod),
          icon: const Icon(
            Icons.add_rounded,
            color: ColorsManager.neutral50,
          ),
        )
      ],
    );
  }

  Widget _emptyPaymentMethod(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.creditCardIllustration),
        verticalSpace(32),
        Text(
          'Save time on your bookings',
          style: TextStyles.font20Neutral900Bold,
        ),
        verticalSpace(24),
        Text(
          'You can safely add and save cards to your account. That way, you’ll book faster next time.',
          style: TextStyles.font14Neutral900Regular,
          textAlign: TextAlign.center,
        ),
        verticalSpace(24),
        _addPaymentMethodButton(context)
      ],
    );
  }

  Widget _addPaymentMethodButton(BuildContext context) {
    return AppTextButton(
      buttonText: 'Add card',
      buttonHeight: 38,
      buttonWidth: 148.w,
      textStyle: TextStyles.font12Neutral50Semibold,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () => context.pushNamed(Routes.paymentMethod),
    );
  }
}
