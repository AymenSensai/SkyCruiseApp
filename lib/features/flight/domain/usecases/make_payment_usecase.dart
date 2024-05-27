import '../../../../core/networking/api_result.dart';
import '../entities/payment.dart';
import '../repos/flight_repo.dart';

class MakePaymentUseCase {
  final FlightRepo _repository;

  MakePaymentUseCase(this._repository);

  Future<ApiResult<PaymentEntity>> call(String amount, String currency) async {
    return await _repository.getClientSecret(amount, currency);
  }
}
