import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../controllers/profile_cubit.dart';
import '../controllers/profile_state.dart';

class UserBlocListener extends StatelessWidget {
  const UserBlocListener({super.key, required this.onGetUser});

  final Function(UserEntity) onGetUser;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) => current is ProfileSuccess,
      listener: (context, state) {
        state.whenOrNull(
          profileSuccess: (response) {
            final user = response as UserEntity;
            onGetUser(user);
          },
        );
      },
      child: null,
    );
  }
}
