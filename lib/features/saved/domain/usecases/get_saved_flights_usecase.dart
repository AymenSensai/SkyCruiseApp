import '../../../../core/networking/api_result.dart';
import '../../../search/domain/entities/flight.dart';
import '../repos/saved_repo.dart';

class GetSavedFlightsUseCase {
  final SavedRepo _repository;

  GetSavedFlightsUseCase(this._repository);

  Future<ApiResult<List<FlightEntity>>> call() async {
    return await _repository.getSavedFlights();
  }
}
