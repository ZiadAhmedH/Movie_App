part of 'fav_movie_bloc.dart';

@immutable
sealed class FavMovieState {}

final class FavMovieInitial extends FavMovieState {}


final class FavMoviesLoading extends FavMovieState {}


final class FavMoviesLoaded extends FavMovieState {
  final List<FavoriteMovieModel> favoriteMovies;

  FavMoviesLoaded(this.favoriteMovies);
}


final class FavMoviesError extends FavMovieState {
  final String message;

  FavMoviesError(this.message);
}

final class FavMovieAdded extends FavMovieState {
  final FavoriteMovieModel favoriteMovieModel;

  FavMovieAdded(this.favoriteMovieModel);
}


final class FavMovieDeleted extends FavMovieState {
  final FavoriteMovieModel favoriteMovieModel;

  FavMovieDeleted(this.favoriteMovieModel);
}


