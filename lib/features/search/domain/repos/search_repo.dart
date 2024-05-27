import '../../../../core/networking/api_result.dart';
import '../entities/flight.dart';

abstract class SearchRepo {
  Future<ApiResult<List<FlightEntity>>> searchFlights(
    String? departureAirport,
    String? arrivalAirport,
    String? departureDate,
    String? arrivalDate,
  );
}
