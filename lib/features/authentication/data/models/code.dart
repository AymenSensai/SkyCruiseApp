import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/code.dart';

part 'code.g.dart';

@JsonSerializable()
class CodeModel {
  CodeModel({required this.code});

  @JsonKey(name: 'code')
  final int code;

  factory CodeModel.fromJson(Map<String, dynamic> json) =>
      _$CodeModelFromJson(json);

  CodeEntity toCodeEntity() => CodeEntity(code: code);
}
