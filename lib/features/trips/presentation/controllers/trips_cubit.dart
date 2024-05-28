import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_saved_flights_usecase.dart';
import 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit(this._getReservationsUseCase) : super(const TripsState.initial());

  final GetReservationsUseCase _getReservationsUseCase;

  void getReservations() async {
    emit(const TripsState.tripsLoading());
    final response = await _getReservationsUseCase.call();
    response.when(
      success: (response) {
        emit(TripsState.tripsSuccess(response));
      },
      failure: (error) {
        emit(TripsState.tripsError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
