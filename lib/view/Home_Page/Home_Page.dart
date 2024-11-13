import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/Page_Cubit/page_cubit.dart';
import 'dart:ui';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
      body: BlocBuilder<PageCubit, PageState>(builder: (context, state) {
        var pageCubit = context.read<PageCubit>();
        return pageCubit.pages[pageCubit.currentIndex];
      }),
      bottomNavigationBar: BlocBuilder<PageCubit, PageState>(builder: (context, state) {
        var pageCubit = context.read<PageCubit>();
        return BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'TV Shows',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          currentIndex: pageCubit.currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            pageCubit.changeIndex(index);
          },
        );
      }),
    );
  }
}
