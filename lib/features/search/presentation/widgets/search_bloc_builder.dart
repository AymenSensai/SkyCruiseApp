import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/flights_list_view.dart';
import '../../domain/entities/flight.dart';
import '../controllers/search_cubit.dart';
import '../controllers/search_state.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          current is SearchLoading ||
          current is SearchSuccess ||
          current is SearchError,
      builder: (context, state) {
        return state.maybeWhen(
            searchLoading: () {
              return const Center(
                child:
                    CircularProgressIndicator(color: ColorsManager.primary500),
              );
            },
            searchSuccess: (response) {
              final flights = response as List<FlightEntity>;
              return FlightsListView(flights: flights);
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }
}
