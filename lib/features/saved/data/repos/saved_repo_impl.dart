import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/utils/shared_prefs.dart';
import '../../../search/domain/entities/flight.dart';
import '../../domain/repos/saved_repo.dart';

class SavedRepoImpl extends SavedRepo {
  final ApiService _apiService;

  SavedRepoImpl(this._apiService);

  @override
  Future<ApiResult<List<FlightEntity>>> getSavedFlights() async {
    try {
      final token = SharedPreferencesService.getToken();
      final response = await _apiService.getSavedFlights('Bearer $token');
      final flightsEntity =
          response.map((flightModel) => flightModel.toFlightEntity()).toList();
      return ApiResult.success(flightsEntity);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
