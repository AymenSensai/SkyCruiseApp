import '../../../../core/networking/api_result.dart';
import '../repos/flight_repo.dart';

class DeleteSavedFlightUseCase {
  final FlightRepo _repository;

  DeleteSavedFlightUseCase(this._repository);

  Future<ApiResult> call(int flightId) async {
    return await _repository.deleteSavedFlight(flightId);
  }
}
