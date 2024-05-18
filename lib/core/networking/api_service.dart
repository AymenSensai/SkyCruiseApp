import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/authentication/data/models/auth_request_body.dart';
import '../../features/authentication/data/models/code.dart';
import '../../features/authentication/data/models/token.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.signIn)
  Future<TokenModel> signIn(@Body() SignInRequestBody signInRequestBody);

  @POST(ApiConstants.signUp)
  Future<TokenModel> signUp(@Body() SignUpRequestBody signUpRequestBody);

  @POST(ApiConstants.sendEmail)
  Future<CodeModel> sendEmail(
      @Body() SendEmailRequestBody sendEmailRequestBody);

  @POST(ApiConstants.passwordReset)
  Future<TokenModel> passwordReset(
      @Body() PasswordResetRequestBody passwordResetRequestBody);
}
