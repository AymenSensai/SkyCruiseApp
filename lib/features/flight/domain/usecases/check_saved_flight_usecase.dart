import '../../../../core/networking/api_result.dart';
import '../repos/flight_repo.dart';

class CheckSavedFlightUseCase {
  final FlightRepo _repository;

  CheckSavedFlightUseCase(this._repository);

  Future<ApiResult> call(int flightId) async {
    return await _repository.checkSavedFlight(flightId);
  }
}
