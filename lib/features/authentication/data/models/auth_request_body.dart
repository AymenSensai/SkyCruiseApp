import 'package:json_annotation/json_annotation.dart';

part 'auth_request_body.g.dart';

@JsonSerializable()
class SignInRequestBody {
  final String email;
  final String password;

  SignInRequestBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SignInRequestBodyToJson(this);
}

@JsonSerializable()
class SignUpRequestBody {
  final String username;
  final String email;
  final String password;

  SignUpRequestBody({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}

@JsonSerializable()
class SendEmailRequestBody {
  final String email;

  SendEmailRequestBody({
    required this.email,
  });

  Map<String, dynamic> toJson() => _$SendEmailRequestBodyToJson(this);
}

@JsonSerializable()
class PasswordResetRequestBody {
  final String email;
  final String password;

  PasswordResetRequestBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$PasswordResetRequestBodyToJson(this);
}
