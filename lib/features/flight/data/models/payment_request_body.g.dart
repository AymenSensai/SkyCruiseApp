// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequestBody _$PaymentRequestBodyFromJson(Map<String, dynamic> json) =>
    PaymentRequestBody(
      json['amount'] as String,
      json['currency'] as String,
    );

Map<String, dynamic> _$PaymentRequestBodyToJson(PaymentRequestBody instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };
