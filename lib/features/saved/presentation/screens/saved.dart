import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/flights_list_view.dart';
import '../../../../core/widgets/search_text_button.dart';
import '../../../search/domain/entities/flight.dart';
import '../controllers/saved_cubit.dart';
import '../controllers/saved_state.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<SavedCubit>(context).getSavedFlights();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved')),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: BlocConsumer<SavedCubit, SavedState>(
          buildWhen: (previous, current) =>
              current is SavedSuccess || current is SavedLoading,
          builder: (context, state) {
            return state.maybeWhen(
              savedLoading: () => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primary500,
                ),
              ),
              savedSuccess: (data) {
                final flights = data as List<FlightEntity>;
                if (flights.isEmpty) {
                  return Center(
                      child: SingleChildScrollView(child: _emptySaved()));
                } else {
                  return SingleChildScrollView(
                      child: FlightsListView(flights: flights));
                }
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
          listenWhen: (previous, current) => current is SavedError,
          listener: (context, state) {
            state.whenOrNull(
              savedError: (error) {
                errorSnackbar(context, error);
              },
            );
          },
        ),
      )),
    );
  }

  Widget _emptySaved() {
    return Column(
      children: [
        SvgPicture.asset(Assets.savedIllustration),
        verticalSpace(32),
        Text(
          'Save what you like for later',
          style: TextStyles.font20Neutral900Bold,
        ),
        verticalSpace(24),
        Text(
          'Create lists of your favorite flights to help you share, compare and book.',
          style: TextStyles.font14Neutral900Regular,
          textAlign: TextAlign.center,
        ),
        verticalSpace(24),
        const SearchTextButton()
      ],
    );
  }
}
