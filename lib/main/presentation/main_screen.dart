import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import '../../dependancy_Injection/service_DI.dart';
import '../controller/screen_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ScreenCubit>(),
      child: BlocBuilder<ScreenCubit, ScreenState>(
        builder: (context, state) {
          final screenCubit = context.read<ScreenCubit>();
          int currentIndex = (state is ScreenChanged) ? state.index : 0;

          return Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: screenCubit.screens[currentIndex],
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: currentIndex,
              onDestinationSelected: (index) {
                HapticFeedback.lightImpact();
                screenCubit.changeScreen(index);
              },
              destinations: const [
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.home , size: 20),
                  selectedIcon: FaIcon(FontAwesomeIcons.home , size: 15),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.tv , size: 20),
                  selectedIcon: FaIcon(FontAwesomeIcons.tv , size: 15),
                  label: 'tv Shows',
                ),
                NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.magnifyingGlass , size: 20),
                  selectedIcon: FaIcon(FontAwesomeIcons.magnifyingGlass , size: 15),
                  label: 'Search',
                ),
                NavigationDestination(
                    icon:FaIcon(FontAwesomeIcons.user , size: 20),
                    label: 'Profile',
                )
              ],
              indicatorColor: Colors.orange,
              backgroundColor: Colors.grey[900],
              height: MediaQuery.of(context).size.height * 0.08,
              animationDuration: const Duration(milliseconds: 500),
            ),
          );
        },
      ),
    );
  }
}
