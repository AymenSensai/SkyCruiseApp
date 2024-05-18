// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestBody _$SignInRequestBodyFromJson(Map<String, dynamic> json) =>
    SignInRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignInRequestBodyToJson(SignInRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

SignUpRequestBody _$SignUpRequestBodyFromJson(Map<String, dynamic> json) =>
    SignUpRequestBody(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpRequestBodyToJson(SignUpRequestBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };

SendEmailRequestBody _$SendEmailRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SendEmailRequestBody(
      email: json['email'] as String,
    );

Map<String, dynamic> _$SendEmailRequestBodyToJson(
        SendEmailRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

PasswordResetRequestBody _$PasswordResetRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PasswordResetRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$PasswordResetRequestBodyToJson(
        PasswordResetRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
