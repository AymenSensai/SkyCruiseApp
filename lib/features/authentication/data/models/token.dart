import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/token.dart';

part 'token.g.dart';

@JsonSerializable()
class TokenModel {
  const TokenModel({required this.token});

  final String token;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  TokenEntity toTokenEntity() => TokenEntity(
        token: token,
      );
}
