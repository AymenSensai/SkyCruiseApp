import '../../../../core/networking/api_result.dart';
import '../entities/token.dart';
import '../repos/auth_repo.dart';

class SignInUseCase {
  final AuthRepo _repository;

  SignInUseCase(this._repository);

  Future<ApiResult<TokenEntity>> call(String email, String password) async {
    return await _repository.signIn(email, password);
  }
}
