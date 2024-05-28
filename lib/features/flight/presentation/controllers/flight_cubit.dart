import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sky_cruise/features/search/domain/usecases/search_flights_usecase.dart';

import '../../../../core/networking/api_result.dart';
import '../../../profile/domain/entities/passenger.dart';
import '../../../profile/domain/entities/user.dart';
import '../../../profile/domain/usecases/get_passengers_usecase.dart';
import '../../../profile/domain/usecases/get_profile_usecase.dart';
import '../../../search/domain/entities/flight.dart';
import '../../domain/entities/seat.dart';
import '../../domain/usecases/add_saved_flight_usecase.dart';
import '../../domain/usecases/check_saved_flight_usecase.dart';
import '../../domain/usecases/delete_saved_flight_usecase.dart';
import '../../domain/usecases/get_seats_reserved_usecase.dart';
import '../../domain/usecases/make_payment_usecase.dart';
import '../../domain/usecases/reserve_flight_usecase.dart';
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
    this._getSeatsReservedUseCase,
    this._searchFlightsUseCase,
  ) : super(const FlightState.initial());

  final AddSavedFlightUseCase _addSavedFlightUseCase;
  final DeleteSavedFlightUseCase _deleteSavedFlightUseCase;
  final CheckSavedFlightUseCase _checkSavedFlightUseCase;
  final GetProfileUseCase _getProfileUseCase;
  final GetPassengersUseCase _getPassengersUseCase;
  final ReserveFlightUseCase _reserveFlightUseCase;
  final MakePaymentUseCase _makePaymentUseCase;
  final GetSeatsReservedUseCase _getSeatsReservedUseCase;
  final SearchFlightsUseCase _searchFlightsUseCase;

  int? numberOfPassengers;
  List<PassengerEntity>? passengers = [];
  List<String> selectedPassengers = [];
  FlightEntity? flight;
  FlightEntity? arrivalFlight;
  UserEntity? user;
  List<String> savedSeats = [];
  String seatClass = '';
  bool? isSaved;
  List<SeatEntity> seatsReserved = [];

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

  void fetchProfileAndPassengersAndReturnFlight(String? date) async {
    emit(const FlightState.flightLoading());

    try {
      List<Future<ApiResult<Object>>> futures = [
        _getProfileUseCase.call(),
        _getPassengersUseCase.call(),
      ];

      if (date != null && flight != null) {
        futures.add(_searchFlightsUseCase.call(
          flight!.arrival.airport.code,
          flight!.departure.airport.code,
          date,
          null,
        ));
      }

      List<ApiResult<Object>> results = await Future.wait(futures);

      final profileResponse = results[0];
      final passengersResponse = results[1];
      final flightsResponse = results.length > 2 ? results[2] : null;

      profileResponse.when(
        success: (profileData) {
          passengersResponse.when(
            success: (passengersData) {
              if (flightsResponse != null) {
                flightsResponse.when(
                  success: (flightData) {
                    user = profileData as UserEntity;
                    passengers = passengersData as List<PassengerEntity>;
                    final flights = flightData as List<FlightEntity>;
                    if (flights.isNotEmpty) {
                      arrivalFlight = flights[0];
                    }
                    fillSelectedPassengers();
                    emit(const FlightState.flightSuccess(null));
                  },
                  failure: (flightError) {
                    emit(FlightState.flightError(
                        error: flightError.apiErrorModel.message ??
                            'Flight fetch error'));
                  },
                );
              } else {
                user = profileData as UserEntity;
                passengers = passengersData as List<PassengerEntity>;
                fillSelectedPassengers();
                emit(const FlightState.flightSuccess(null));
              }
            },
            failure: (passengerError) {
              emit(FlightState.flightError(
                  error: passengerError.apiErrorModel.message ??
                      'Passenger fetch error'));
            },
          );
        },
        failure: (profileError) {
          emit(FlightState.flightError(
              error:
                  profileError.apiErrorModel.message ?? 'Profile fetch error'));
        },
      );
    } catch (error) {
      emit(FlightState.flightError(error: error.toString()));
    }
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

  void getSeatsReserved() async {
    final response = await _getSeatsReservedUseCase.call(flight!.id);
    response.when(
      success: (response) {
        seatsReserved = response;
      },
      failure: (error) {},
    );
  }
}
