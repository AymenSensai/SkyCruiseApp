import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/home/presentation/screens/Home.dart';
import '../../features/profile/presentation/screens/profile.dart';
import '../../features/saved/presentation/screens/saved.dart';
import '../../features/trips/presentation/screens/trips.dart';
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
          _bootmNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 0 ? Assets.homeSolid : Assets.homeRegular,
            ),
            label: 'Home',
          ),
          _bootmNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 1 ? Assets.savedSolid : Assets.savedRegular,
            ),
            label: 'Saved',
          ),
          _bootmNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 2 ? Assets.tripsSolid : Assets.tripsRegular,
            ),
            label: 'Trips',
          ),
          _bootmNavigationBarItem(
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
        return const SavedScreen();
      case 2:
        return const TripsScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const Text('No route defined for this tab');
    }
  }

  BottomNavigationBarItem _bootmNavigationBarItem({
    required Widget icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(padding: const EdgeInsets.only(bottom: 4), child: icon),
      label: label,
    );
  }
}
