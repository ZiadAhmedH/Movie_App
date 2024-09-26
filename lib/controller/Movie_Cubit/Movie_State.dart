import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../../model/models/Movie_Model.dart';
import '../commenMovieState.dart';

class MovieState implements MovieStateInterface{
  final IList<Movie> movies;
  final IList<Movie> favoriteMovies;
  final IList<Movie> watchedMovies;
  final IList<Movie> threeDMovies;
  final bool isLoading;
  final bool hasMoreMovies;
  final int currentPage;
  final String? error;

  MovieState({
    required this.movies,
    required this.favoriteMovies,
    required this.watchedMovies,
    required this.threeDMovies,
    required this.isLoading,
    required this.hasMoreMovies,
    required this.currentPage,
    this.error,
  });

  // Factory constructor to create the initial state
  factory MovieState.initial() {
    return MovieState(
      movies: IList([]),
      favoriteMovies: IList([]),
      watchedMovies: IList([]),
      threeDMovies: IList([]),
      isLoading: false,
      hasMoreMovies: true,
      currentPage: 1,
      error: null,
    );
  }

  // CopyWith method to clone and modify state immutably
  MovieState copyWith({
    IList<Movie>? movies,
    IList<Movie>? favoriteMovies,
    IList<Movie>? watchedMovies,
    IList<Movie>? threeDMovies,
    bool? isLoading,
    bool? hasMorePages,
    int? currentPage,
    String? error,
  }) {
    return MovieState(
      movies: movies ?? this.movies,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      watchedMovies: watchedMovies ?? this.watchedMovies,
      threeDMovies: threeDMovies ?? this.threeDMovies,  // Added for 3D movies
      isLoading: isLoading ?? this.isLoading,
      hasMoreMovies: hasMorePages ?? this.hasMoreMovies,
      currentPage: currentPage ?? this.currentPage,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object o) =>
      o is MovieState &&
          o.movies == movies &&
          o.favoriteMovies == favoriteMovies &&
          o.watchedMovies == watchedMovies &&
          o.threeDMovies == threeDMovies &&  // Compare 3D movies
          o.isLoading == isLoading &&
          o.hasMoreMovies == hasMoreMovies &&
          o.currentPage == currentPage &&
          o.error == error;

  @override
  int get hashCode =>
      movies.hashCode ^
      favoriteMovies.hashCode ^
      watchedMovies.hashCode ^
      threeDMovies.hashCode ^  // Hash for 3D movies
      isLoading.hashCode ^
      hasMoreMovies.hashCode ^
      currentPage.hashCode ^
      error.hashCode;
}
