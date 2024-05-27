import '../../../../core/networking/api_result.dart';
import '../entities/user.dart';
import '../repos/profile_repo.dart';

class GetProfileUseCase {
  final ProfileRepo _repository;

  GetProfileUseCase(this._repository);

  Future<ApiResult<UserEntity>> call() async {
    return await _repository.getProfile();
  }
}
