import '../../../../core/networking/api_result.dart';
import '../../../flight/domain/entities/reservation.dart';

abstract class TripsRepo {
  Future<ApiResult<List<ReservationEntity>>> getReservations();
}
