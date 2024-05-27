import '../../../../core/networking/api_result.dart';
import '../repos/flight_repo.dart';

class ReserveFlightUseCase {
  final FlightRepo _repository;

  ReserveFlightUseCase(this._repository);

  Future<ApiResult> call(int flightId, List<int> passengers, List<String> seats,
      String seatClass) async {
    return await _repository.reserveFlight(
        flightId, passengers, seats, seatClass);
  }
}
