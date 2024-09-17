
import '../../model/models/Movie_Model.dart';

sealed class MoviesDetailsState {}

class MoviesDetailsLoading extends MoviesDetailsState {}

class MoviesDetailsError extends MoviesDetailsState {
  final String message;

  MoviesDetailsError(this.message);
}

class MoviesDetailsLoaded extends MoviesDetailsState {
  final Movie movie;
  final bool isFavorite;
  final bool isWatched;

  MoviesDetailsLoaded(this.movie, this.isFavorite, this.isWatched);

  MoviesDetailsLoaded copyWith({
    Movie? movie,
    bool? isFavorite,
    bool? isWatched,
  }) =>
      MoviesDetailsLoaded(
        movie ?? this.movie,
        isFavorite ?? this.isFavorite,
        isWatched ?? this.isWatched,
      );
}