import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Data/Models/fav_movie_model.dart';
import '../../../domain/entities/movie_details.dart';
import '../../controller/fav_bloc_movie/fav_movie_bloc.dart';
import '../../controller/fav_bloc_movie/fav_movie_state.dart';

class FavoriteButton extends StatelessWidget {
  final MovieDetails movieDetails;
  const FavoriteButton({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: BlocBuilder<FavMovieBloc, FavMovieState>(
        builder: (context, state) {


          bool isFavorite = state.favoriteMovies.any((movie) => movie.id == movieDetails.id);

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const FaIcon(FontAwesomeIcons.video, color: Colors.white, size: 30),
                const FaIcon(FontAwesomeIcons.share, color: Colors.white, size: 30),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    final favoriteMovie = FavoriteMovieModel(
                      id: movieDetails.id!,
                      title: movieDetails.title!,
                      posterPath: movieDetails.posterPath!,
                    );

                    if (isFavorite) {
                      context.read<FavMovieBloc>().add(RemoveFavMovieEvent(favoriteMovie.id));
                    } else {
                      context.read<FavMovieBloc>().add(AddFavMovieEvent(favoriteMovie));
                    }

                    // ✅ Immediately refresh the favorite list
                    context.read<FavMovieBloc>().add(FetchFavMoviesEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
