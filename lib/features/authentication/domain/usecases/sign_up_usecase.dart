import '../../../../core/networking/api_result.dart';
import '../entities/token.dart';
import '../repos/auth_repo.dart';

class SignUpUseCase {
  final AuthRepo _repository;

  SignUpUseCase(this._repository);

  Future<ApiResult<TokenEntity>> call(
      String username, String email, String password) async {
    return await _repository.signUp(username, email, password);
  }
}
