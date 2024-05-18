import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/usecases/password_reset_usecase.dart';
import '../../domain/usecases/send_email_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._signInUseCase, this._signUpUseCase, this._sendEmailUseCase,
      this._passwordResetUseCase)
      : super(const AuthState.initial());
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SendEmailUseCase _sendEmailUseCase;
  final PasswordResetUseCase _passwordResetUseCase;

  Future<void> _authenticate(Future<ApiResult> Function() useCaseCall) async {
    emit(const AuthState.authLoading());
    final response = await useCaseCall();
    response.when(
      success: (response) {
        emit(AuthState.authSuccess(response));
      },
      failure: (error) {
        emit(AuthState.authError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void signIn(String email, String password) async {
    await _authenticate(() => _signInUseCase.call(email, password));
  }

  void signUp(String username, String email, String password) async {
    await _authenticate(() => _signUpUseCase.call(username, email, password));
  }

  void sendEmail(String email) async {
    await _authenticate(() => _sendEmailUseCase.call(email));
  }

  void passwordReset(String email, String password) async {
    await _authenticate(() => _passwordResetUseCase.call(email, password));
  }
}
