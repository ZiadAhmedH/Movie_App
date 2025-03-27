import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../Core/Constents/enums.dart';
import '../../../../dependancy_Injection/service_DI.dart';
import '../components/details_movie_components/fav_button.dart';
import '../components/details_movie_components/movie_cast.dart';
import '../components/details_movie_components/movie_header.dart';
import '../components/details_movie_components/movie_info.dart';
import '../components/details_movie_components/movie_recommendations.dart';
import '../controller/fav_bloc_movie/fav_movie_bloc.dart';
import '../controller/movie_detail_bloc/movie_details_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: sl<FavMovieBloc>()..add(CheckIfMovieFavEvent(id)),
        ),        BlocProvider(
            create: (context) => sl<MovieDetailsBloc>()
              ..add(FetchMovieDetailsEvent(id))
              ..add(FetchMovieRecommendationsEvent(id))
              ..add(FetchMovieCastEvent(id))..add(FetchMovieVideoEvent(id))),
      ],
      child: Scaffold(body: MovieDetailContent(id: id)),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  final int id;
  const MovieDetailContent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return Center(child: Lottie.asset('assets/lotties/loading.json', width: 200, height: 200));

          case RequestState.error:
            return Center(child: Text(state.movieDetailsMessage));

          case RequestState.loaded:
            if (state.movieDetails == null) {
              return const Center(child: Text("Movie details not available"));
            }
            final movieDetails = state.movieDetails!;
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                MovieHeader(movieDetails: movieDetails),
                MovieInfoSection(movieDetails: movieDetails),
                SliverToBoxAdapter(child: FavoriteButton(movieDetails: movieDetails)),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: MovieCastList(state: state)),

                MovieRecommendations(state: state),

              ],
            );
          case RequestState.idle:
            return const Center(
              child: Text(
                'Search for movies',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
        }
      },
    );
  }
}
