import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/home/presentation/screens/Home.dart';
import '../../features/profile/presentation/controllers/profile_cubit.dart';
import '../../features/profile/presentation/screens/profile.dart';
import '../../features/saved/presentation/controllers/saved_cubit.dart';
import '../../features/saved/presentation/screens/saved.dart';
import '../../features/trips/presentation/controllers/trips_cubit.dart';
import '../../features/trips/presentation/screens/trips.dart';
import '../di/dependency_injection.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';
import '../utils/assets.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.primary500,
        selectedLabelStyle: TextStyles.font12Primary500Medium,
        unselectedLabelStyle: TextStyles.font12Neutral900Medium,
        unselectedItemColor: ColorsManager.neutral900,
        backgroundColor: Colors.white,
        iconSize: 24,
        items: [
          _bottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0 ? Assets.homeSolid : Assets.homeRegular,
            ),
            label: 'Home',
          ),
          _bottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1 ? Assets.savedSolid : Assets.savedRegular,
            ),
            label: 'Saved',
          ),
          _bottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 2 ? Assets.tripsSolid : Assets.tripsRegular,
            ),
            label: 'Trips',
          ),
          _bottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 3 ? Assets.profileSolid : Assets.profileRegular,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return BlocProvider(
          create: (context) => getIt<SavedCubit>(),
          child: const SavedScreen(),
        );
      case 2:
        return BlocProvider(
          create: (context) => getIt<TripsCubit>(),
          child: const TripsScreen(),
        );
      case 3:
        return BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
          child: const ProfileScreen(),
        );
      default:
        return const Text('No route defined for this tab');
    }
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required Widget icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(padding: const EdgeInsets.only(bottom: 4), child: icon),
      label: label,
    );
  }
}
