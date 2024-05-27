import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/airport.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future<ApiResult<List<AirportEntity>>> getAirports() async {
    try {
      final response = await _apiService.getAirports();
      final airports = response
          .map((airportModel) => airportModel.toAirportEntity())
          .toList();
      return ApiResult.success(airports);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
