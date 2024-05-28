import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/utils/shared_prefs.dart';
import '../../../flight/domain/entities/reservation.dart';
import '../../domain/repos/trips_repo.dart';

class TripsRepoImpl extends TripsRepo {
  final ApiService _apiService;

  TripsRepoImpl(this._apiService);

  @override
  Future<ApiResult<List<ReservationEntity>>> getReservations() async {
    try {
      final token = SharedPreferencesService.getToken();
      final response = await _apiService.getReservations('Bearer $token');
      final reservationEntity = response
          .map((reservationModel) => reservationModel.toReservationEntity())
          .toList();
      print('Brooo wee $reservationEntity');
      return ApiResult.success(reservationEntity);
    } catch (error) {
      print('Brooo wee $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
