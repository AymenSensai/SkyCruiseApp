import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/search_flights_usecase.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchFlightsUseCase) : super(const SearchState.initial());

  final SearchFlightsUseCase _searchFlightsUseCase;
  int? numberOfPassengers;
  String? seatClass;

  void searchFlights(
    String? departureAirport,
    String? arrivalAirport,
    String? departureDate,
    String? arrivalDate,
  ) async {
    emit(const SearchState.searchLoading());
    final response = await _searchFlightsUseCase.call(
      departureAirport,
      arrivalAirport,
      departureDate,
      arrivalDate,
    );
    response.when(
      success: (response) {
        emit(SearchState.searchSuccess(response));
      },
      failure: (error) {
        emit(SearchState.searchError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void changeNumberOfPassengers(int number) {
    numberOfPassengers = number;
  }

  void changeSeatClass(String newClass) {
    seatClass = newClass;
  }
}
