import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/utils/shared_prefs.dart';
import '../../domain/entities/passenger.dart';
import '../../domain/entities/user.dart';
import '../../domain/repos/profile_repo.dart';
import '../models/passenger.dart';
import '../models/user.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiService _apiService;

  ProfileRepoImpl(this._apiService);

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
  Future<ApiResult> modifyProfile(UserEntity user) async {
    try {
      final token = SharedPreferencesService.getToken();
      await _apiService.modifyProfile(
          'Bearer $token', UserModel.toUserModel(user));
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<PassengerEntity>>> getPassengers() async {
    try {
      final token = SharedPreferencesService.getToken();
      final response = await _apiService.getPassengers('Bearer $token');
      final passengersEntity = response
          .map((passengerModel) => passengerModel.toPassengerEntity())
          .toList();
      return ApiResult.success(passengersEntity);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult> addPassenger(PassengerEntity passenger) async {
    try {
      final token = SharedPreferencesService.getToken();
      await _apiService.addPassenger(
          'Bearer $token', PassengerModel.toPassengerModel(passenger));
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult> updatePassenger(PassengerEntity passenger) async {
    try {
      final token = SharedPreferencesService.getToken();
      await _apiService.updatePassenger(
          'Bearer $token', PassengerModel.toPassengerModel(passenger));
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
