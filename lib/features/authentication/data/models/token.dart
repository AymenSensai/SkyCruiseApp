import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/token.dart';

part 'token.g.dart';

@JsonSerializable()
class TokenModel {
  TokenModel({required this.accessToken, required this.refreshToken});

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  TokenEntity toTokenEntity() => TokenEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
