part of 'fav_movie_bloc.dart';

@immutable
sealed class FavMovieEvent {}

class FetchFavMoviesEvent extends FavMovieEvent {}

class AddFavMovieEvent extends FavMovieEvent {
  final FavoriteMovieModel favoriteMovieModel;
  AddFavMovieEvent(this.favoriteMovieModel);
}

class RemoveFavMovieEvent extends FavMovieEvent {
  final int movieId;
  RemoveFavMovieEvent(this.movieId);
}

class CheckIfMovieFavEvent extends FavMovieEvent {
  final int movieId;
  CheckIfMovieFavEvent(this.movieId);
}
