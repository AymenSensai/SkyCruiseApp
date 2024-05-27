import '../../../../core/networking/api_result.dart';
import '../../../profile/domain/entities/user.dart';
import '../entities/payment.dart';

abstract class FlightRepo {
  Future<ApiResult> addSavedFlight(int flightId);
  Future<ApiResult> deleteSavedFlight(int flightId);
  Future<ApiResult> checkSavedFlight(int flightId);

  Future<ApiResult<UserEntity>> getProfile();
  Future<ApiResult> reserveFlight(
      int flightId, List<int> passengers, List<String> seats, String seatClass);

  Future<ApiResult<PaymentEntity>> getClientSecret(
      String amount, String currency);
}
