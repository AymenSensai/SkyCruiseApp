import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/passenger.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/add_passenger_usecase.dart';
import '../../domain/usecases/get_passengers_usecase.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/modify_profile_usecase.dart';
import '../../domain/usecases/update_passenger_usecase.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._getProfileUseCase,
    this._modifyProfileUseCase,
    this._getPassengersUseCase,
    this._addPassengerUseCase,
    this._updatePassengerUseCase,
  ) : super(const ProfileState.initial());

  final GetProfileUseCase _getProfileUseCase;
  final ModifyProfileUseCase _modifyProfileUseCase;
  final GetPassengersUseCase _getPassengersUseCase;
  final AddPassengerUseCase _addPassengerUseCase;
  final UpdatePassengerUseCase _updatePassengerUseCase;

  void getProfile() async {
    emit(const ProfileState.profileLoading());
    final response = await _getProfileUseCase.call();
    response.when(
      success: (response) {
        emit(ProfileState.profileSuccess(response));
      },
      failure: (error) {
        emit(ProfileState.profileError(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void modifyProfile(UserEntity user) async {
    emit(const ProfileState.profileLoading());
    await _modifyProfileUseCase.call(user);
  }

  void getPassengers() async {
    emit(const ProfileState.profileLoading());
    final response = await _getPassengersUseCase.call();
    response.when(
      success: (response) {
        emit(ProfileState.profileSuccess(response));
      },
      failure: (error) {
        emit(ProfileState.profileError(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void addPassenger(PassengerEntity passenger) async {
    emit(const ProfileState.profileLoading());
    final response = await _addPassengerUseCase.call(passenger);
    response.when(
      success: (response) {
        emit(ProfileState.profileSuccess(response));
      },
      failure: (error) {
        emit(ProfileState.profileError(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void updatePassenger(PassengerEntity passenger) async {
    emit(const ProfileState.profileLoading());
    final response = await _updatePassengerUseCase.call(passenger);
    response.when(
      success: (response) {
        emit(ProfileState.profileSuccess(response));
      },
      failure: (error) {
        emit(ProfileState.profileError(
            error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
