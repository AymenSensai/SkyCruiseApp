import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_airports_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getAirportsUseCase) : super(const HomeState.initial());

  final GetAirportsUseCase _getAirportsUseCase;

  void getAirports() async {
    emit(const HomeState.homeLoading());
    final response = await _getAirportsUseCase.call();
    response.when(
      success: (response) {
        emit(HomeState.homeSuccess(response));
      },
      failure: (error) {
        emit(HomeState.homeError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
