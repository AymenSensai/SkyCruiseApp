import '../../../../core/networking/api_result.dart';
import '../entities/airport.dart';

abstract class HomeRepo {
  Future<ApiResult<List<AirportEntity>>> getAirports();
}
