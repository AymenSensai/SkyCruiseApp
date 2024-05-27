import '../../../../core/networking/api_result.dart';
import '../../../search/domain/entities/flight.dart';

abstract class SavedRepo {
  Future<ApiResult<List<FlightEntity>>> getSavedFlights();
}
