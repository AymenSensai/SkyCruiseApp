import '../../../../core/networking/api_result.dart';
import '../entities/airport.dart';
import '../repos/home_repo.dart';

class GetAirportsUseCase {
  final HomeRepo _repository;

  GetAirportsUseCase(this._repository);

  Future<ApiResult<List<AirportEntity>>> call() async {
    return await _repository.getAirports();
  }
}
