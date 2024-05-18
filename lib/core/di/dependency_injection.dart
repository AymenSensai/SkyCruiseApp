import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/data/repos/auth_repo_impl.dart';
import '../../features/authentication/domain/repos/auth_repo.dart';
import '../../features/authentication/domain/usecases/password_reset_usecase.dart';
import '../../features/authentication/domain/usecases/send_email_usecase.dart';
import '../../features/authentication/domain/usecases/sign_in_usecase.dart';
import '../../features/authentication/domain/usecases/sign_up_usecase.dart';
import '../../features/authentication/presentation/controllers/auth_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

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
}
