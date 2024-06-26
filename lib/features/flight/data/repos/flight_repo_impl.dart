import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/stripe_service.dart';
import '../../../../core/utils/shared_prefs.dart';
import '../../../profile/domain/entities/user.dart';
import '../../domain/entities/payment.dart';
import '../../domain/entities/reservation.dart';
import '../../domain/entities/seat.dart';
import '../../domain/repos/flight_repo.dart';
import '../models/payment_request_body.dart';
import '../models/reservation_request_body.dart';

class FlightRepoImpl extends FlightRepo {
  final ApiService _apiService;
  final StripeService _stripeService;

  FlightRepoImpl(this._apiService, this._stripeService);

  @override
  Future<ApiResult<UserEntity>> getProfile() async {
    try {
      final token = SharedPreferencesService.getToken();
      final response = await _apiService.getProfile('Bearer $token');
      return ApiResult.success(response.toUserEntity());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult> addSavedFlight(int flightId) async {
    try {
      final token = SharedPreferencesService.getToken();
      await _apiService.addSavedFlight('Bearer $token', flightId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult> deleteSavedFlight(int flightId) async {
    try {
      final token = SharedPreferencesService.getToken();
      await _apiService.deleteSavedFlight('Bearer $token', flightId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult> checkSavedFlight(int flightId) async {
    try {
      final token = SharedPreferencesService.getToken();
      await _apiService.checkSavedFlight('Bearer $token', flightId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ReservationEntity>> reserveFlight(int flightId,
      List<int> passengers, List<String> seats, String seatClass) async {
    try {
      final token = SharedPreferencesService.getToken();
      List<ReservationSeatRequestBody> requestBodies = [];

      for (int i = 0; i < passengers.length; i++) {
        requestBodies.add(
          ReservationSeatRequestBody(
            passenger: passengers[i],
            seatNumber: seats[i],
            seatClass: seatClass,
          ),
        );
      }

      final reserve = ReservationRequestBody(
        flight: flightId,
        status: 'confirmed',
        reservationSeats: requestBodies,
      );
      final response =
          await _apiService.reserveFlight('Bearer $token', reserve);
      return ApiResult.success(response.toReservationEntity());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<PaymentEntity>> getClientSecret(
      String amount, String currency) async {
    try {
      final response = await _stripeService
          .getClientSecret(PaymentRequestBody(amount, currency));
      return ApiResult.success(response.toPaymentEntity());
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<SeatEntity>>> getSeatsReserved(int flightId) async {
    try {
      final token = SharedPreferencesService.getToken();
      final response =
          await _apiService.getSeatsReserved('Bearer $token', flightId);
      final seatsEntity =
          response.map((seatModel) => seatModel.toSeatEntity()).toList();
      return ApiResult.success(seatsEntity);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
