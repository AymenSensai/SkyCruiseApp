import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sky_cruise/features/flight/data/models/reservation.dart';
import 'package:sky_cruise/features/flight/data/models/reservation_request_body.dart';

import '../../features/authentication/data/models/auth_request_body.dart';
import '../../features/authentication/data/models/code.dart';
import '../../features/authentication/data/models/token.dart';
import '../../features/home/data/models/airport.dart';
import '../../features/profile/data/models/passenger.dart';
import '../../features/profile/data/models/user.dart';
import '../../features/search/data/models/flight.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.signIn)
  Future<TokenModel> signIn(@Body() SignInRequestBody signInRequestBody);

  @POST(ApiConstants.signUp)
  Future<TokenModel> signUp(@Body() SignUpRequestBody signUpRequestBody);

  @POST(ApiConstants.sendEmail)
  Future<CodeModel> sendEmail(
      @Body() SendEmailRequestBody sendEmailRequestBody);

  @POST(ApiConstants.passwordReset)
  Future<TokenModel> passwordReset(
      @Body() PasswordResetRequestBody passwordResetRequestBody);

  @GET(ApiConstants.airports)
  Future<List<AirportModel>> getAirports();

  @GET(ApiConstants.searchFlights)
  Future<List<FlightModel>> searchFlights(
    @Query("departure_airport") String? departureAirport,
    @Query("arrival_airport") String? arrivalAirport,
    @Query("departure_date") String? departureDate,
    @Query("arrival_date") String? arrivalDate,
  );

  @GET(ApiConstants.profile)
  Future<UserModel> getProfile(@Header("Authorization") String bearerToken);

  @PUT(ApiConstants.profile)
  Future<void> modifyProfile(
      @Header("Authorization") String bearerToken, @Body() UserModel user);

  @GET(ApiConstants.passengers)
  Future<List<PassengerModel>> getPassengers(
    @Header("Authorization") String bearerToken,
  );
  @POST(ApiConstants.passengers)
  Future<void> addPassenger(
    @Header("Authorization") String bearerToken,
    @Body() PassengerModel passenger,
  );
  @PUT(ApiConstants.passengers)
  Future<void> updatePassenger(
    @Header("Authorization") String bearerToken,
    @Body() PassengerModel passenger,
  );

  @GET(ApiConstants.getSavedFlights)
  Future<List<FlightModel>> getSavedFlights(
    @Header("Authorization") String bearerToken,
  );
  @POST("${ApiConstants.addSavedFlight}/{flightId}")
  Future<void> addSavedFlight(
    @Header("Authorization") String bearerToken,
    @Path("flightId") int flightId,
  );
  @DELETE("${ApiConstants.deleteSavedFlight}/{flightId}")
  Future<void> deleteSavedFlight(
    @Header("Authorization") String bearerToken,
    @Path("flightId") int flightId,
  );
  @GET("${ApiConstants.checkSavedFlight}/{flightId}")
  Future<void> checkSavedFlight(
    @Header("Authorization") String bearerToken,
    @Path("flightId") int flightId,
  );
  @POST(ApiConstants.reservations)
  Future<void> reserveFlight(
    @Header("Authorization") String bearerToken,
    @Body() ReservationRequestBody reservation,
  );
  @GET(ApiConstants.reservations)
  Future<List<ReservationModel>> getReservations(
      @Header("Authorization") String bearerToken);
}
