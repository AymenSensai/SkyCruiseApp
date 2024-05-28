import '../../../../core/networking/api_result.dart';
import '../../../flight/domain/entities/reservation.dart';
import '../repos/trips_repo.dart';

class GetReservationsUseCase {
  final TripsRepo _repository;

  GetReservationsUseCase(this._repository);

  Future<ApiResult<List<ReservationEntity>>> call() async {
    return await _repository.getReservations();
  }
}
