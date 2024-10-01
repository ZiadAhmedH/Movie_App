import 'package:bloc/bloc.dart';
import '../../../model/models/Movie_Model.dart';
import 'detials_movie_state.dart';

class MoviesDetailsCubit extends Cubit<MovieDetailsState> {

  // List to store favorite movies
  List<Movie> favoriteList = [];

  MoviesDetailsCubit() : super(MoviesDetailsLoading());

  // Fetch movie details and check if it's in favorites
  void fetchMovieDetails(Movie movie) {
    final isFavorite = favoriteList.contains(movie);
    final isWatched = false;
    emit(MoviesDetailsLoaded(
      movie: movie,
      isFavorite: isFavorite,
      isWatched: isWatched,
      favoriteList: favoriteList,
    ));
  }

  // Toggle favorite state for a specific movie
  void toggleFavorite(Movie movie) {
    if (state is! MoviesDetailsLoaded) return;

    final currentState = state as MoviesDetailsLoaded;

    if (currentState.isFavorite) {
      // Remove movie from favorites
      favoriteList.remove(movie);
    } else {
      // Add movie to favorites
      favoriteList.add(movie);
      emit(currentState.copyWith(favoriteList: favoriteList));
    }


  }
}
