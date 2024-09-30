import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/controller/Repos/Movies_Repo.dart';
import '../../model/models/Movie_Model.dart';
import 'detials_movie_state.dart';

class MoviesDetailsCubit extends Cubit<MovieDetailsState> {
  MoviesDetailsCubit() : super(MoviesDetailsLoading());
   final MoviesRepo _moviesRepo = GetIt.instance<MoviesRepo>();
  void fetchMovieDetails(Movie movie) {
    // Assuming you have logic to determine if a movie is favorite or watched
    final isFavorite = state.favoriteList.contains(movie);
    final isWatched = state.watchedList.contains(movie);


    emit(MoviesDetailsLoaded(
      movie: movie,
      isFavorite: isFavorite,
      isWatched: isWatched,
    ));
  }

  // Add or remove from favorites
  void toggleFavorite(Movie movie) {
     emit(MoviesDetailsLoading());

     if (state is! MoviesDetailsLoaded) return;

     


  }



  // Add or remove from watched
  void toggleWatched(Movie movie) {
    if (state is! MoviesDetailsLoaded) return;

    final currentState = state as MoviesDetailsLoaded;
    final updatedWatched = List<Movie>.from(currentState.watchedList);

    if (updatedWatched.contains(movie)) {
      updatedWatched.remove(movie); // Remove from watched
    } else {
      updatedWatched.add(movie); // Add to watched
    }

    emit(currentState.copyWith(
      isWatched: !currentState.isWatched,
      watchedList: updatedWatched,
    ));
  }
}
