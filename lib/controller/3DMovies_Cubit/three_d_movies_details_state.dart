part of 'three_d_movies_details_cubit.dart';

@immutable
abstract class ThreeDMoviesDetailsState {}

class ThreeDMoviesDetailsLoading extends ThreeDMoviesDetailsState {}



class MoviesDetailsError extends ThreeDMoviesDetailsState {
  final String message;

  MoviesDetailsError(this.message);
}

class MoviesDetailsLoaded extends ThreeDMoviesDetailsState {
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
