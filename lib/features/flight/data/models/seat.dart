import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/seat.dart';

part 'seat.g.dart';

@JsonSerializable()
class SeatModel {
  String passenger;
  @JsonKey(name: 'seat_number')
  String seatNumber;

  SeatModel({
    required this.passenger,
    required this.seatNumber,
  });

  factory SeatModel.fromJson(Map<String, dynamic> json) =>
      _$SeatModelFromJson(json);

  SeatEntity toSeatEntity() => SeatEntity(
        passenger: passenger,
        seatNumber: seatNumber,
      );
}
