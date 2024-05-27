import '../../../../core/networking/api_result.dart';
import '../entities/passenger.dart';
import '../entities/user.dart';

abstract class ProfileRepo {
  Future<ApiResult<UserEntity>> getProfile();

  Future<ApiResult> modifyProfile(UserEntity user);

  Future<ApiResult<List<PassengerEntity>>> getPassengers();
  Future<ApiResult> addPassenger(PassengerEntity passenger);
  Future<ApiResult> updatePassenger(PassengerEntity passenger);
}
