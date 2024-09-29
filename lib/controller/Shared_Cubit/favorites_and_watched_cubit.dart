import 'package:bloc/bloc.dart';

import '../../model/models/Movie_Model.dart';
import 'favorites_and_watched_state.dart';

class FavoritesAndWatchedCubit extends Cubit<FavoritesAndWatchedState> {
  FavoritesAndWatchedCubit() : super(FavoritesAndWatchedState());


  bool isFavorite(Movie movie) {
   return state.favs.contains(movie);
  }

  bool isWatched(Movie movie) {
   return state.watched.contains(movie);
  }

  void toggleFavorite(Movie movie) {
    final newFavs = List<Movie>.from(state.favs); // Create a mutable copy of the current favorites
    if (newFavs.contains(movie)) {
      newFavs.remove(movie); // Remove if it already exists
    } else {
      newFavs.add(movie); // Add to favorites
    }

    // Emit the updated state with the new favorites list
    emit(state.copyWith(favs: newFavs));
  }

  void toggleWatched(Movie movie) {
    final newWatched = List<Movie>.from(state.watched); // Create a mutable copy of the current watched list
    if (newWatched.contains(movie)) {
      newWatched.remove(movie); // Remove if it already exists
    } else {
      newWatched.add(movie); // Add to watched
    }

    // Emit the updated state with the new watched list
    emit(state.copyWith(watched: newWatched));
  }
}
