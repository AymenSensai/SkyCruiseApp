import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sky_cruise/features/flight/domain/usecases/check_saved_flight_usecase.dart';
import 'package:sky_cruise/features/flight/domain/usecases/reserve_flight_usecase.dart';
import 'package:sky_cruise/features/profile/domain/entities/user.dart';
import 'package:sky_cruise/features/search/domain/entities/flight.dart';

import '../../../profile/domain/entities/passenger.dart';
import '../../../profile/domain/usecases/get_passengers_usecase.dart';
import '../../../profile/domain/usecases/get_profile_usecase.dart';
import '../../domain/usecases/add_saved_flight_usecase.dart';
import '../../domain/usecases/delete_saved_flight_usecase.dart';
import '../../domain/usecases/make_payment_usecase.dart';
import 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  FlightCubit(
    this._deleteSavedFlightUseCase,
    this._addSavedFlightUseCase,
    this._getProfileUseCase,
    this._getPassengersUseCase,
    this._reserveFlightUseCase,
    this._makePaymentUseCase,
    this._checkSavedFlightUseCase,
  ) : super(const FlightState.initial());

  final AddSavedFlightUseCase _addSavedFlightUseCase;
  final DeleteSavedFlightUseCase _deleteSavedFlightUseCase;
  final CheckSavedFlightUseCase _checkSavedFlightUseCase;
  final GetProfileUseCase _getProfileUseCase;
  final GetPassengersUseCase _getPassengersUseCase;
  final ReserveFlightUseCase _reserveFlightUseCase;
  final MakePaymentUseCase _makePaymentUseCase;

  int? numberOfPassengers;
  List<PassengerEntity>? passengers = [];
  List<String> selectedPassengers = [];
  FlightEntity? flight;
  UserEntity? user;
  List<String> savedSeats = [];
  String seatClass = '';
  bool isSaved = false;

  void fillSelectedPassengers() {
    selectedPassengers = [];
    for (int i = 0; i < numberOfPassengers!; i++) {
      if (passengers!.length > i) {
        selectedPassengers.add(passengers![i].name!);
      }
    }
  }

  void changeNumberOfPassengers(int number) {
    numberOfPassengers = number;
  }

  void changeSeatClass(String newClass) {
    seatClass = newClass;
  }

  void changePassengers(String passengerEntity, int index) {
    if (selectedPassengers.length < numberOfPassengers!) {
      selectedPassengers.add(passengerEntity);
    }
    selectedPassengers[index] = passengerEntity;
  }

  void changeFlight(FlightEntity flight) {
    this.flight = flight;
  }

  void fetchProfileAndPassengers() async {
    emit(const FlightState.flightLoading());

    final results = await Future.wait([
      _getProfileUseCase.call(),
      _getPassengersUseCase.call(),
    ]);

    final profileResponse = results[0];
    final passengersResponse = results[1];

    profileResponse.when(
      success: (profileData) {
        passengersResponse.when(
          success: (passengersData) {
            user = profileData as UserEntity;
            passengers = passengersData as List<PassengerEntity>;
            fillSelectedPassengers();
            emit(const FlightState.flightSuccess(null));
          },
          failure: (passengerError) {
            emit(FlightState.flightError(
                error: passengerError.apiErrorModel.message ?? ''));
          },
        );
      },
      failure: (profileError) {
        emit(FlightState.flightError(
            error: profileError.apiErrorModel.message ?? ''));
      },
    );
  }

  void addSavedFlight() async {
    final response = await _addSavedFlightUseCase.call(flight!.id);
    response.when(
      success: (response) {
        isSaved = true;
      },
      failure: (error) {},
    );
  }

  void deleteSavedFlight() async {
    final response = await _deleteSavedFlightUseCase.call(flight!.id);
    response.when(
      success: (response) {
        isSaved = false;
      },
      failure: (error) {},
    );
  }

  void checkSavedFlight(int flightId) async {
    emit(const FlightState.flightLoading());
    final response = await _checkSavedFlightUseCase.call(flightId);
    response.when(
      success: (response) {
        isSaved = true;
      },
      failure: (error) {
        isSaved = false;
      },
    );
  }

  Future<void> reserveFlight() async {
    List<int> selectedPassengerIds = [];

    for (String selectedName in selectedPassengers) {
      for (PassengerEntity passenger in passengers!) {
        if (passenger.name == selectedName) {
          selectedPassengerIds.add(passenger.id!);
          break;
        }
      }
    }

    final response = await _reserveFlightUseCase.call(
        flight!.id, selectedPassengerIds, savedSeats, seatClass);
    response.when(
      success: (response) {
        emit(FlightState.flightSuccess(response));
      },
      failure: (error) {
        emit(FlightState.flightError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void emitUserState(UserEntity? newUser) {
    user = newUser;
    emit(FlightState.flightSuccess(user));
  }

  void emitPassengerState(PassengerEntity? passenger) {
    passengers?.add(passenger!);
    fillSelectedPassengers();
    emit(FlightState.flightSuccess(passengers));
  }

  void saveSeats(List<String> seats) {
    savedSeats = seats;
  }

  void makePayment(double amount, String currency) async {
    final response = await _makePaymentUseCase.call(
        (amount * 100).toStringAsFixed(0), currency);
    response.when(success: (response) async {
      await _initializePaymentSheet(response.clientSecret!);
      await Stripe.instance.presentPaymentSheet();
      await reserveFlight();
    }, failure: (error) {
      emit(FlightState.flightError(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Aymen",
      ),
    );
  }
}
