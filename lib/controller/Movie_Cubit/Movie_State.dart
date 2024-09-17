import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../model/models/Movie_Model.dart';

class MovieState {
  final IList<Movie> movies;
  final IList<Movie> favoriteMovies; // Added
  final IList<Movie> watchedMovies;  // Added
  final bool isLoading;
  final bool hasMorePages;
  final int currentPage;
  final String? error;

  MovieState({
    required this.movies,
    required this.favoriteMovies, // Added
    required this.watchedMovies,  // Added
    required this.isLoading,
    required this.hasMorePages,
    required this.currentPage,
    this.error,
  });

  // Factory constructor to create the initial state
  factory MovieState.initial() {
    return MovieState(
      movies: IList([]),
      favoriteMovies: IList([]), // Initialize empty list
      watchedMovies: IList([]),  // Initialize empty list
      isLoading: false,
      hasMorePages: true,
      currentPage: 1,
      error: null,
    );
  }

  // CopyWith method to clone and modify state immutably
  MovieState copyWith({
    IList<Movie>? movies,
    IList<Movie>? favoriteMovies, // Added
    IList<Movie>? watchedMovies,  // Added
    bool? isLoading,
    bool? hasMorePages,
    int? currentPage,
    String? error,
  }) {
    return MovieState(
      movies: movies ?? this.movies,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies, // Added
      watchedMovies: watchedMovies ?? this.watchedMovies,   // Added
      isLoading: isLoading ?? this.isLoading,
      hasMorePages: hasMorePages ?? this.hasMorePages,
      currentPage: currentPage ?? this.currentPage,
      error: error ?? this.error,
    );
  }

  // Optional: Override equality and hashCode to compare MovieState instances correctly
  @override
  bool operator ==(Object o) =>
      o is MovieState &&
          o.movies == movies &&
          o.favoriteMovies == favoriteMovies && // Added
          o.watchedMovies == watchedMovies &&   // Added
          o.isLoading == isLoading &&
          o.hasMorePages == hasMorePages &&
          o.currentPage == currentPage &&
          o.error == error;

  @override
  int get hashCode =>
      movies.hashCode ^
      favoriteMovies.hashCode ^ // Added
      watchedMovies.hashCode ^  // Added
      isLoading.hashCode ^
      hasMorePages.hashCode ^
      currentPage.hashCode ^
      error.hashCode;
}
