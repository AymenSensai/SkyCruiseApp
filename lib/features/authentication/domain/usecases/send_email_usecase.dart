import '../../../../core/networking/api_result.dart';
import '../entities/code.dart';
import '../repos/auth_repo.dart';

class SendEmailUseCase {
  final AuthRepo _repository;

  SendEmailUseCase(this._repository);

  Future<ApiResult<CodeEntity>> call(String email) async {
    return await _repository.sendEmail(email);
  }
}
