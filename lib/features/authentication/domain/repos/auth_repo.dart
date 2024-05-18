import '../../../../core/networking/api_result.dart';
import '../entities/code.dart';
import '../entities/token.dart';

abstract class AuthRepo {
  Future<ApiResult<TokenEntity>> signIn(String email, String password);
  Future<ApiResult<TokenEntity>> signUp(
      String username, String email, String password);
  Future<ApiResult<CodeEntity>> sendEmail(String email);
  Future<ApiResult<TokenEntity>> passwordReset(String email, String password);
}
