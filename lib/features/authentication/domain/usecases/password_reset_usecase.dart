import '../../../../core/networking/api_result.dart';
import '../entities/token.dart';
import '../repos/auth_repo.dart';

class PasswordResetUseCase {
  final AuthRepo _repository;

  PasswordResetUseCase(this._repository);

  Future<ApiResult<TokenEntity>> call(String email, String password) async {
    return await _repository.passwordReset(email, password);
  }
}
