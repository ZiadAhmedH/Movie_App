import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/controller/Tv_Series/Cubit/series_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../controller/Constant/ApiEndPoints.dart';
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
            BlocProvider(
              create: (context) => MovieCubit()..getRandomMovies(),
              child: BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: LoadingAnimationWidget.discreteCircle(
                          color: Colors.deepOrange, size: 50),
                    );
                  } else if (state is MovieError) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: const Center(
                        child: Text('Error'),
                      ),
                    );
                  } else if (state is MovieLoaded) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CachedNetworkImage(
                        imageUrl: "${ApiEndPoints.MOVIE_Base_Poster}${state.randomMovie.posterPath}",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),

            // Trending Movies Section
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
