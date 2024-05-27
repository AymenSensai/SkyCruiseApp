import 'package:json_annotation/json_annotation.dart';
part 'payment_request_body.g.dart';

@JsonSerializable()
class PaymentRequestBody {
  final String amount;
  final String currency;

  PaymentRequestBody(this.amount, this.currency);

  Map<String, dynamic> toJson() => _$PaymentRequestBodyToJson(this);
}
