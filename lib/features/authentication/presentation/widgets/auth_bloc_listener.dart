import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/utils/shared_prefs.dart';
import '../../domain/entities/code.dart';
import '../../domain/entities/token.dart';
import '../controllers/auth_cubit.dart';
import '../controllers/auth_state.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({super.key, this.email, this.isRememberMeBoxChecked});

  final String? email;
  final bool? isRememberMeBoxChecked;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoading ||
          current is AuthSuccess ||
          current is AuthError,
      listener: (context, state) {
        state.whenOrNull(
          authLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primary500,
                ),
              ),
            );
          },
          authSuccess: (response) {
            context.pop();
            if (email == null) {
              if (isRememberMeBoxChecked!) {
                final token = (response as TokenEntity).token;
                SharedPreferencesService.saveToken(token);
              }
              context.pushNamedAndRemoveUntil(
                Routes.appHome,
                predicate: (Route<dynamic> route) => false,
              );
            } else {
              final code = (response as CodeEntity).code;
              context.pushNamed(Routes.confirmOtp, arguments: [code, email]);
            }
          },
          authError: (error) {
            context.pop();
            errorSnackbar(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
