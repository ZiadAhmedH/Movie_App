import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/controller/Tv_Series/Cubit/series_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../controller/Movie/Presentation/MovieSection/Movie_Section.dart';
import '../../controller/Movie/cubit/Movie_Cubit.dart';
import '../../controller/Movie/cubit/Movie_State.dart';
import '../../controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
import '../../controller/Tv_Series/presentation/Series_Section/Series_Section.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Providing MoviesDetailsCubit at the top level so all child widgets can access it
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Trending Movies Section
            const SizedBox(
              height: 100,
            ),
            BlocProvider(
              create: (context) => MovieCubit()..fetchPopularMovies(),
              child: const MovieSectionView(),
            ),
            const SizedBox(
              height: 20,
            ),
            // Trending Series Section

            BlocProvider(
              create: (context) => SeriesCubit()..fetchTrendingSeries(),
              child: const SeriesSection(),
            ),

          ],
        ),
      ),
    );
  }
}
