import '../../../../core/networking/api_result.dart';
import '../entities/passenger.dart';
import '../repos/profile_repo.dart';

class AddPassengerUseCase {
  final ProfileRepo _repository;

  AddPassengerUseCase(this._repository);

  Future<ApiResult> call(PassengerEntity passenger) async {
    return await _repository.addPassenger(passenger);
  }
}
