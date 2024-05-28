import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/payment.dart';

part 'payment.g.dart';

@JsonSerializable()
class PaymentModel {
  @JsonKey(name: 'client_secret')
  String? clientSecret;

  PaymentModel({this.clientSecret});

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  PaymentEntity toPaymentEntity() => PaymentEntity(clientSecret: clientSecret);
}
