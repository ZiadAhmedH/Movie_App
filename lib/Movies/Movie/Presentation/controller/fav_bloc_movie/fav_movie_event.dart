part of 'fav_movie_bloc.dart';

@immutable
sealed class FavMovieEvent {}

class FetchFavMoviesEvent extends FavMovieEvent {
  FetchFavMoviesEvent();
}

class AddFavMovieEvent extends FavMovieEvent {
  final FavoriteMovieModel favoriteMovieModel;

  AddFavMovieEvent(this.favoriteMovieModel);
}


