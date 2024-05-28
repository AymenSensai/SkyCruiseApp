import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/extensions.dart';
import '../controllers/flight_cubit.dart';
import '../controllers/flight_state.dart';

class FlightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FlightAppBar({super.key, required this.isBack});

  final bool isBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FlightCubit, FlightState>(
          buildWhen: (previous, current) =>
              current is FlightSuccess ||
              current is FlightError ||
              current is FlightLoading,
          builder: (context, state) {
            return state.maybeWhen(
                flightLoading: () => _AppBar(
                      isSaved: context.read<FlightCubit>().isSaved ?? false,
                      isBack: isBack,
                    ),
                flightSuccess: (response) => _AppBar(
                    isSaved: context.read<FlightCubit>().isSaved ?? false,
                    isBack: isBack),
                flightError: (error) => _AppBar(
                    isSaved: context.read<FlightCubit>().isSaved ?? false,
                    isBack: isBack),
                orElse: () => const SizedBox.shrink());
          },
        ),
      ],
    );
  }
}

class _AppBar extends StatefulWidget {
  const _AppBar({required this.isSaved, required this.isBack});
  final bool isSaved;
  final bool isBack;

  @override
  State<_AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  late bool _isSaved;

  @override
  void initState() {
    super.initState();
    _isSaved = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flight details'),
      centerTitle: true,
      leading: widget.isBack
          ? IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_rounded,
              ),
            )
          : IconButton(
              onPressed: () => context.pushNamedAndRemoveUntil(
                Routes.appHome,
                predicate: (Route<dynamic> route) => false,
              ),
              icon: const Icon(
                Icons.close_rounded,
              ),
            ),
      actions: [
        IconButton(
          onPressed: () {
            if (_isSaved) {
              context.read<FlightCubit>().deleteSavedFlight();
              setState(() {
                _isSaved = false;
              });
            } else {
              context.read<FlightCubit>().addSavedFlight();
              setState(() {
                _isSaved = true;
              });
            }
          },
          icon: _isSaved
              ? SvgPicture.asset(
                  Assets.savedSolid,
                  colorFilter: const ColorFilter.mode(
                      ColorsManager.neutral50, BlendMode.srcIn),
                )
              : const Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }
}
