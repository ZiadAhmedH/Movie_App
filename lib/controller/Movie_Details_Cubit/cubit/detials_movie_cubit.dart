import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Movie/Data/Models/Movie_Model.dart';
import 'detials_movie_state.dart';

class MoviesDetailsCubit extends Cubit<MovieDetailsState> {

  // List to store favorite movies
  List<Movie> favoriteList = [];

  List<Movie> watchedList = [];

  MoviesDetailsCubit() : super(MoviesDetailsLoading());

  static MoviesDetailsCubit get(context) => BlocProvider.of(context);

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

      emit(currentState.copyWith(
        favoriteList: favoriteList,
        isFavorite: isFavorite,
      ));
      print("Removed from Favorite ${state.favoriteList.length}");

    } else {
      // Add movie to favorites
      favoriteList.add(movie);
      isFavorite = true; // Update favorite status
      emit(currentState.copyWith(
        favoriteList: favoriteList,
        isFavorite: isFavorite,
      ));
      print("Added from Favorite ${state.favoriteList.length}");

    }


  }


}