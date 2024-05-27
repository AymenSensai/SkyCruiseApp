import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_saved_flights_usecase.dart';
import 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit(this._getSavedFlightsUseCase) : super(const SavedState.initial());

  final GetSavedFlightsUseCase _getSavedFlightsUseCase;

  void getSavedFlights() async {
    emit(const SavedState.savedLoading());
    final response = await _getSavedFlightsUseCase.call();
    response.when(
      success: (response) {
        emit(SavedState.savedSuccess(response));
      },
      failure: (error) {
        emit(SavedState.savedError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
