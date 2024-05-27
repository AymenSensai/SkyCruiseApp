import '../entities/passenger.dart';
import '../repos/profile_repo.dart';

import '../../../../core/networking/api_result.dart';

class UpdatePassengerUseCase {
  final ProfileRepo _repository;

  UpdatePassengerUseCase(this._repository);

  Future<ApiResult> call(PassengerEntity passenger) async {
    return await _repository.updatePassenger(passenger);
  }
}
