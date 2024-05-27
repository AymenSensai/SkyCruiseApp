import '../../../../core/networking/api_result.dart';
import '../repos/flight_repo.dart';

class AddSavedFlightUseCase {
  final FlightRepo _repository;

  AddSavedFlightUseCase(this._repository);

  Future<ApiResult> call(int flightId) async {
    return await _repository.addSavedFlight(flightId);
  }
}
