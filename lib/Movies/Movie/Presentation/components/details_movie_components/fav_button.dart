import 'package:animate_do/animate_do.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/Movies/Movie/Presentation/components/details_movie_components/video_player/youtube_player_screen.dart';
import 'package:video_player/video_player.dart';
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
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.video, color: Colors.white, size: 30),
                  onPressed: () => _showTrailer(context , videoUrl:"https://www.youtube.com/watch?v=muUgLcfl9Sk"),
                ),
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

  void _showTrailer(BuildContext context ,{required String videoUrl}) {

    showDialog(
      context: context,
      barrierDismissible: true, // Allows dismissing by tapping outside
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: YouTubePlayerScreen(videoUrl: videoUrl),
          ),
        ),
      ),
    );
  }
}
