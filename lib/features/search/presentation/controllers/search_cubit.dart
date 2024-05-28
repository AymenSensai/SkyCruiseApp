import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/flight.dart';
import '../../domain/usecases/search_flights_usecase.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchFlightsUseCase) : super(const SearchState.initial());

  final SearchFlightsUseCase _searchFlightsUseCase;
  int? numberOfPassengers;
  String? seatClass;
  String? arrivalDate;

  List<FlightEntity> allFlights = [];
  String selectedFilter = 'Best';

  void changeFilter(String filter) {
    selectedFilter = filter;
    filterFlights();
  }

  void searchFlights(
    String? departureAirport,
    String? arrivalAirport,
    String? departureDate,
  ) async {
    emit(const SearchState.searchLoading());
    final response = await _searchFlightsUseCase.call(
        departureAirport, arrivalAirport, departureDate, null);
    response.when(
      success: (response) {
        allFlights = response;
        filterFlights();
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

  void changeArrivalDate(String? date) {
    arrivalDate = date;
  }

  void filterFlights() {
    List<FlightEntity> filteredFlights;
    switch (selectedFilter) {
      case 'Cheapest':
        filteredFlights = List.from(allFlights)
          ..sort(
              (a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
        break;
      case 'Fastest':
        filteredFlights = List.from(allFlights)
          ..sort((a, b) => a.getDuration().compareTo(b.getDuration()));

        break;
      default:
        filteredFlights = allFlights;
    }
    emit(SearchSuccess(filteredFlights));
  }
}
