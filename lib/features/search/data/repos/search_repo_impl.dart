import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/flight.dart';
import '../../domain/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService _apiService;

  SearchRepoImpl(this._apiService);

  @override
  Future<ApiResult<List<FlightEntity>>> searchFlights(
      String? departureAirport,
      String? arrivalAirport,
      String? departureDate,
      String? arrivalDate) async {
    try {
      final response = await _apiService.searchFlights(
          departureAirport, arrivalAirport, departureDate, arrivalDate);
      final flights =
          response.map((flightModel) => flightModel.toFlightEntity()).toList();
      return ApiResult.success(flights);
    } catch (error) {
      print(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
