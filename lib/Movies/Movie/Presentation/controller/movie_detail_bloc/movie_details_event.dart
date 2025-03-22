part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class FetchMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const FetchMovieDetailsEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}


class FetchMovieRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

  const FetchMovieRecommendationsEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class FetchMovieCastEvent extends MovieDetailsEvent {
  final int movieId;

  const FetchMovieCastEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
