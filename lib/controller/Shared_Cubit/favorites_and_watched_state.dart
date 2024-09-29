
import '../../model/models/Movie_Model.dart';

class FavoritesAndWatchedState {
  final List<Movie> favs;
  final List<Movie> watched;

  FavoritesAndWatchedState({this.favs = const [], this.watched = const []});

  FavoritesAndWatchedState copyWith({List<Movie>? favs, List<Movie>? watched}) {
    return FavoritesAndWatchedState(
      favs: favs ?? this.favs,
      watched: watched ?? this.watched,
    );
  }
}
