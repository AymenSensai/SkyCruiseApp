import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/code.dart';
import '../../domain/entities/token.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/auth_request_body.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<ApiResult<TokenEntity>> signIn(String email, String password) async {
    try {
      final response = await _apiService
          .signIn(SignInRequestBody(email: email, password: password));
      return ApiResult.success(response.toTokenEntity());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<TokenEntity>> signUp(
      String username, String email, String password) async {
    try {
      final response = await _apiService.signUp(SignUpRequestBody(
          username: username, email: email, password: password));
      return ApiResult.success(response.toTokenEntity());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CodeEntity>> sendEmail(String email) async {
    try {
      final response =
          await _apiService.sendEmail(SendEmailRequestBody(email: email));
      return ApiResult.success(response.toCodeEntity());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<TokenEntity>> passwordReset(
      String email, String password) async {
    try {
      final response = await _apiService.passwordReset(
          PasswordResetRequestBody(email: email, password: password));
      return ApiResult.success(response.toTokenEntity());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
