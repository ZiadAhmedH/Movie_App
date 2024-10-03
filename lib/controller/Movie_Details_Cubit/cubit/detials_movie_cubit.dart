import 'package:bloc/bloc.dart';
import '../../../model/models/Movie_Model.dart';
import 'detials_movie_state.dart';

class MoviesDetailsCubit extends Cubit<MovieDetailsState> {

  // List to store favorite movies
  List<Movie> favoriteList = [];

  List<Movie> watchedList = [];

  MoviesDetailsCubit() : super(MoviesDetailsLoading());

  // Fetch movie details and check if it's in favorites
  void fetchMovieDetails(Movie movie) {
    final isFavorite = favoriteList.contains(movie);
    final isWatched = watchedList.contains(movie);
    emit(MoviesDetailsLoaded(
      movie: movie,
      isFavorite: isFavorite,
      isWatched: isWatched,
      favoriteList: favoriteList,
    ));
  }

  void toggleFavorite(Movie movie) {
    if (state is! MoviesDetailsLoaded) return;

    final currentState = state as MoviesDetailsLoaded;

    bool isFavorite;
    if (currentState.isFavorite) {
      // Remove movie from favorites
      favoriteList.remove(movie);
      isFavorite = false; // Update favorite status
    } else {
      // Add movie to favorites
      favoriteList.add(movie);
      isFavorite = true; // Update favorite status
    }

    // Emit the updated state with new favorite list and updated isFavorite status
    emit(currentState.copyWith(
      favoriteList: favoriteList,
      isFavorite: isFavorite,
    ));

    print("${favoriteList.length} Fav List");
  }


}