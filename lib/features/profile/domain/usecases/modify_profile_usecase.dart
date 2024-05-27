import '../../../../core/networking/api_result.dart';
import '../entities/user.dart';
import '../repos/profile_repo.dart';

class ModifyProfileUseCase {
  final ProfileRepo _repository;

  ModifyProfileUseCase(this._repository);

  Future<ApiResult> call(UserEntity user) async {
    return await _repository.modifyProfile(user);
  }
}
