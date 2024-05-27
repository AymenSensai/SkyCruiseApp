import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sky_cruise/core/networking/api_constants.dart';

import '../../features/flight/data/models/payment.dart';
import '../../features/flight/data/models/payment_request_body.dart';

part 'stripe_service.g.dart';

@RestApi(baseUrl: ApiConstants.stripeBaseUrl)
abstract class StripeService {
  factory StripeService(Dio dio, {String baseUrl}) = _StripeService;

  @POST('payment_intents')
  Future<PaymentModel> getClientSecret(
    @Body() PaymentRequestBody paymentRequestBody,
  );
}
