import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            body: screenCubit.screens[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => screenCubit.changeScreen(index),
              items: const [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.home),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.gear),
                  label: 'settings',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
