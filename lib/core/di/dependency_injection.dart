import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sky_cruise/features/flight/domain/usecases/check_saved_flight_usecase.dart';
import 'package:sky_cruise/features/flight/domain/usecases/make_payment_usecase.dart';
import 'package:sky_cruise/features/flight/presentation/controllers/flight_cubit.dart';
import 'package:sky_cruise/features/trips/presentation/controllers/trips_cubit.dart';

import '../../features/authentication/data/repos/auth_repo_impl.dart';
import '../../features/authentication/domain/repos/auth_repo.dart';
import '../../features/authentication/domain/usecases/password_reset_usecase.dart';
import '../../features/authentication/domain/usecases/send_email_usecase.dart';
import '../../features/authentication/domain/usecases/sign_in_usecase.dart';
import '../../features/authentication/domain/usecases/sign_up_usecase.dart';
import '../../features/authentication/presentation/controllers/auth_cubit.dart';
import '../../features/flight/data/repos/flight_repo_impl.dart';
import '../../features/flight/domain/repos/flight_repo.dart';
import '../../features/flight/domain/usecases/add_saved_flight_usecase.dart';
import '../../features/flight/domain/usecases/delete_saved_flight_usecase.dart';
import '../../features/flight/domain/usecases/reserve_flight_usecase.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/home/domain/usecases/get_airports_usecase.dart';
import '../../features/home/presentation/controllers/home_cubit.dart';
import '../../features/profile/data/repos/profile_repo_impl.dart';
import '../../features/profile/domain/repos/profile_repo.dart';
import '../../features/profile/domain/usecases/add_passenger_usecase.dart';
import '../../features/profile/domain/usecases/get_passengers_usecase.dart';
import '../../features/profile/domain/usecases/get_profile_usecase.dart';
import '../../features/profile/domain/usecases/modify_profile_usecase.dart';
import '../../features/profile/domain/usecases/update_passenger_usecase.dart';
import '../../features/profile/presentation/controllers/profile_cubit.dart';
import '../../features/saved/data/repos/saved_repo_impl.dart';
import '../../features/saved/domain/repos/saved_repo.dart';
import '../../features/saved/domain/usecases/get_saved_flights_usecase.dart';
import '../../features/saved/presentation/controllers/saved_cubit.dart';
import '../../features/search/data/repos/search_repo_impl.dart';
import '../../features/search/domain/repos/search_repo.dart';
import '../../features/search/domain/usecases/search_flights_usecase.dart';
import '../../features/search/presentation/controllers/search_cubit.dart';
import '../../features/trips/data/repos/trips_repo_impl.dart';
import '../../features/trips/domain/repos/trips_repo.dart';
import '../../features/trips/domain/usecases/get_saved_flights_usecase.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import '../networking/stripe_dio_factory.dart';
import '../networking/stripe_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  Dio stripeDio = StripeDioFactory.getDio();
  getIt.registerLazySingleton<StripeService>(() => StripeService(stripeDio));

  // auth
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(getIt()));
  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(getIt()));
  getIt
      .registerLazySingleton<SendEmailUseCase>(() => SendEmailUseCase(getIt()));
  getIt.registerLazySingleton<PasswordResetUseCase>(
      () => PasswordResetUseCase(getIt()));
  getIt.registerFactory<AuthCubit>(
      () => AuthCubit(getIt(), getIt(), getIt(), getIt()));

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerLazySingleton<GetAirportsUseCase>(
      () => GetAirportsUseCase(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // search
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepoImpl(getIt()));
  getIt.registerLazySingleton<SearchFlightsUseCase>(
      () => SearchFlightsUseCase(getIt()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));

  // profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getIt()));
  getIt.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(getIt()));
  getIt.registerLazySingleton<ModifyProfileUseCase>(
      () => ModifyProfileUseCase(getIt()));
  getIt.registerLazySingleton<GetPassengersUseCase>(
      () => GetPassengersUseCase(getIt()));
  getIt.registerLazySingleton<AddPassengerUseCase>(
      () => AddPassengerUseCase(getIt()));
  getIt.registerLazySingleton<UpdatePassengerUseCase>(
      () => UpdatePassengerUseCase(getIt()));
  getIt.registerFactory<ProfileCubit>(
      () => ProfileCubit(getIt(), getIt(), getIt(), getIt(), getIt()));

  // saved
  getIt.registerLazySingleton<SavedRepo>(() => SavedRepoImpl(getIt()));
  getIt.registerLazySingleton<GetSavedFlightsUseCase>(
      () => GetSavedFlightsUseCase(getIt()));
  getIt.registerFactory<SavedCubit>(() => SavedCubit(getIt()));

  // trips
  getIt.registerLazySingleton<TripsRepo>(() => TripsRepoImpl(getIt()));
  getIt.registerLazySingleton<GetReservationsUseCase>(
      () => GetReservationsUseCase(getIt()));
  getIt.registerFactory<TripsCubit>(() => TripsCubit(getIt()));

  // flight details
  getIt.registerLazySingleton<FlightRepo>(
      () => FlightRepoImpl(getIt(), getIt()));
  getIt.registerLazySingleton<AddSavedFlightUseCase>(
      () => AddSavedFlightUseCase(getIt()));
  getIt.registerLazySingleton<DeleteSavedFlightUseCase>(
      () => DeleteSavedFlightUseCase(getIt()));
  getIt.registerLazySingleton<CheckSavedFlightUseCase>(
      () => CheckSavedFlightUseCase(getIt()));
  getIt.registerLazySingleton<ReserveFlightUseCase>(
      () => ReserveFlightUseCase(getIt()));
  getIt.registerLazySingleton<MakePaymentUseCase>(
      () => MakePaymentUseCase(getIt()));
  getIt.registerFactory<FlightCubit>(() => FlightCubit(
      getIt(), getIt(), getIt(), getIt(), getIt(), getIt(), getIt()));
}
