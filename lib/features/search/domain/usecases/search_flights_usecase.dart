import '../../../../core/networking/api_result.dart';
import '../entities/flight.dart';
import '../repos/search_repo.dart';

class SearchFlightsUseCase {
  final SearchRepo _repository;

  SearchFlightsUseCase(this._repository);

  Future<ApiResult<List<FlightEntity>>> call(
    String? departureAirport,
    String? arrivalAirport,
    String? departureDate,
    String? arrivalDate,
  ) async {
    return await _repository.searchFlights(
      departureAirport,
      arrivalAirport,
      departureDate,
      arrivalDate,
    );
  }
}
