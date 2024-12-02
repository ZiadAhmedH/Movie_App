import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Movie/Data/Models/Movie_Model.dart';
import '../cubit/Details_Cubit/detials_movie_cubit.dart';
import '../cubit/Details_Cubit/detials_movie_state.dart';
import 'Details_Movie_Content_Loaded.dart';
import 'ShimmerDetailsMovie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, DetailsMovieState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
          extendBodyBehindAppBar: true,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Show shimmer loader if the state is loading
                  state is DetailsMovieStateLoading
                      ? buildShimmerLoader(context)
                      : buildMovieDetails(
                    context,
                    state,
                        () {
                      context.read<MoviesDetailsCubit>().toggleFavorite(movie);
                    },
                  ),
                  // Show error or no data state if required (optional)
                  if (state is DetailsMovieStateError)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        state.error,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
