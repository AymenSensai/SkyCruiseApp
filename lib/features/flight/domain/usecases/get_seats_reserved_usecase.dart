import '../../../../core/networking/api_result.dart';
import '../entities/seat.dart';
import '../repos/flight_repo.dart';

class GetSeatsReservedUseCase {
  final FlightRepo _repository;

  GetSeatsReservedUseCase(this._repository);

  Future<ApiResult<List<SeatEntity>>> call(int flightId) async {
    return await _repository.getSeatsReserved(flightId);
  }
}
