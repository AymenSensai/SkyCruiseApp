import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/passenger.dart';

part 'passenger.g.dart';

@JsonSerializable()
class PassengerModel {
  final int? id;
  final String? name;
  final String? nationality;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  final bool? gender;
  @JsonKey(name: 'id_number')
  final String? idNumber;

  PassengerModel({
    this.id,
    this.name,
    this.nationality,
    this.dateOfBirth,
    this.gender,
    this.idNumber,
  });

  factory PassengerModel.fromJson(Map<String, dynamic> json) =>
      _$PassengerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerModelToJson(this);

  PassengerEntity toPassengerEntity() => PassengerEntity(
        id: id,
        name: name,
        nationality: nationality,
        dateOfBirth: dateOfBirth,
        gender: gender,
        idNumber: idNumber,
      );

  factory PassengerModel.toPassengerModel(PassengerEntity passenger) =>
      PassengerModel(
        id: passenger.id,
        name: passenger.name,
        nationality: passenger.nationality,
        dateOfBirth: passenger.dateOfBirth,
        gender: passenger.gender,
        idNumber: passenger.idNumber,
      );
}
