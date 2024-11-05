import 'package:equatable/equatable.dart';
import '../Data/Models/Movie_Model.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  final bool hasMoreMovies;
  final bool isLoading;
  final Movie randomMovie;

  const MovieLoaded(
      this.randomMovie, {
    required this.movies,
    this.hasMoreMovies = true,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [movies, hasMoreMovies, isLoading , randomMovie];
}

class MovieError extends MovieState {
  final String error;

  const MovieError(this.error);

  @override
  List<Object?> get props => [error];
}
