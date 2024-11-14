import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/controller/Constant/ApiEndPoints.dart';
import '../../../model/Components/Custom_Text.dart';
import '../../../view/Movie_Video_Page/Movie_Video.dart';
import '../cubit/Details_Cubit/detials_movie_cubit.dart';
import '../cubit/Details_Cubit/detials_movie_state.dart';

Widget buildMovieDetails(BuildContext context, DetailsMovieState state,
    void Function() onToggleFavorite) {
  return Column(
    children: [
      _buildBackdropImage(context, state),
      _buildMovieInfo(context, state, onToggleFavorite),
      _buildOverviewSection(state),
      _buildTrailerButton(context, state),
    ],
  );
}

// Backdrop Image with Gradient Overlay
Widget _buildBackdropImage(BuildContext context, DetailsMovieState state) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.3,
    child: Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              '${ApiEndPoints.MOVIE_Base_Poster}${state.movieDetails.backdropPath}',
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: (context, url) => Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white12,
              size: 100,
            ),
          ),
          errorWidget: (context, url, error) =>
              const FaIcon(FontAwesomeIcons.elementor),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromRGBO(44, 43, 40, 1),
                  Color.fromRGBO(44, 40, 50, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.85, 0.9],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// Movie Title, Rating, and Favorite Icon
Widget _buildMovieInfo(BuildContext context, DetailsMovieState state,
    void Function() onToggleFavorite) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "${state.movieDetails.title}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<MoviesDetailsCubit, DetailsMovieState>(
              builder: (context, state) {
                if (state is DetailsMovieStateLoading) {
                  return const Icon(Icons.favorite_border); // Show a default icon while loading
                } else if (state is DetailsMovieStateLoaded) {
                  return IconButton(
                    icon: Icon(
                        state.isFav ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      onToggleFavorite();
                    },
                  );
                } else {
                  return const Icon(Icons.error);
                }
              },
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow, size: 20),
            Text(
              '${state.movieDetails.voteAverage} (${state.movieDetails.releaseDate?.substring(0, 4)})',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// Overview Section
Widget _buildOverviewSection(DetailsMovieState state) {
  return state.movieDetails.overview != null
      ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Overview',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: " ${state.movieDetails.overview}",
                fontSize: 16,
                color: Colors.white,
              ),
            ],
          ),
        )
      : const SizedBox.shrink();
}

// Trailer Button
Widget _buildTrailerButton(BuildContext context, DetailsMovieState state) {
  return Row(
    children: [
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => YouTubeVideoPlayer(
                videoName: "${state.movieDetails.title}",
              ),
            ),
          );
        },
        child: const FaIcon(
          FontAwesomeIcons.youtube,
          color: Colors.red,
          size: 30,
        ),
      ),
    ],
  );
}
