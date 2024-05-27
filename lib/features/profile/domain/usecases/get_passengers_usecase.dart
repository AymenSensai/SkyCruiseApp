import '../../../../core/networking/api_result.dart';
import '../entities/passenger.dart';
import '../repos/profile_repo.dart';

class GetPassengersUseCase {
  final ProfileRepo _repository;

  GetPassengersUseCase(this._repository);

  Future<ApiResult<List<PassengerEntity>>> call() async {
    return await _repository.getPassengers();
  }
}
