import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie_Cubit/Movie_Cubit.dart';
import 'package:movies_app/controller/Repos/Movies_Repo.dart';
import 'package:movies_app/controller/ThreeDCubit/three_dcubit_cubit.dart';

import '../../controller/Page_Cubit/page_cubit.dart';
import '../../controller/Repos/Movies_ThreeD_Repo.dart';
import '../../controller/Shared_Cubit/favorites_and_watched_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var pageCubit = context.read<PageCubit>();

    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
              MovieCubit(context.read<MoviesRepo>(), context.read<FavoritesAndWatchedCubit>())..fetchMovies(),
            ),
            BlocProvider(
              create: (context) => ThreeDcubitCubit(context.read<ThreeDMovieRepository>(), context.read<FavoritesAndWatchedCubit>())..fetchSample3DMovies(),
            ),
          ],
          child: Scaffold(

              backgroundColor: Color.fromRGBO(44, 43, 43, 1),

              body: pageCubit.pages[pageCubit.currentIndex],

              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Color.fromRGBO(44, 43, 43, 1),
                items: <BottomNavigationBarItem>[
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
                currentIndex: 0,
                selectedItemColor: Colors.amber[800],
                onTap: (index) {
                  pageCubit.changeIndex(index);
                },
              )

          ),
        );
      },
    );
  }
}
