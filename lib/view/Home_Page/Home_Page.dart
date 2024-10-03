import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';

import '../../controller/Movie/cubit/Movie_Cubit.dart';
import '../../controller/Page_Cubit/page_cubit.dart';
import '../../controller/ThreeDMovies/cubit/three_dcubit_cubit.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(
          create: (context) => MovieCubit()..fetchMovies(),
        ),
        BlocProvider(
          create: (context) => ThreeDcubitCubit()..fetchSample3DMovies(),
        ),
      ],
      child: Scaffold(
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
      ),
    );
  }
}
