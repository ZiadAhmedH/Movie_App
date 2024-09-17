import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../model/models/Movie_Model.dart';

class MoviesState {
  const MoviesState({
    required this.query,
    required this.error,
    required this.isLoading,
    required this.movies,
    required this.favoriteMovies,
    required this.watchedMovies,
    required this.hasMore,   // <-- Added hasMore
    required this.currentPage, // <-- Added currentPage to track page number
  });

  factory MoviesState.initial() => MoviesState(
    query: "",
    error: null,
    isLoading: true,
    movies: IList<Movie>(),
    favoriteMovies: IList<Movie>(),
    watchedMovies: IList<Movie>(),
    hasMore: true,           // Initially, assume there are more pages to load
    currentPage: 1,          // Start with the first page
  );

  final String query;
  final String? error;
  final bool isLoading;
  final IList<Movie> movies;
  final IList<Movie> favoriteMovies;
  final IList<Movie> watchedMovies;
  final bool hasMore;        // <-- Indicates if more pages are available
  final int currentPage;     // <-- Track current page for pagination

  bool get hasQuery => query.trim().isNotEmpty;
  bool get hasError => error != null;

  // Filtered movies based on the query
  IList<Movie> get filteredMovies => movies
      .where((m) => m.title.toLowerCase().contains(query.toLowerCase()))
      .toIList();

  MoviesState copyWith({
    String? query,
    bool? isLoading,
    IList<Movie>? movies,
    IList<Movie>? favoriteMovies,
    IList<Movie>? watchedMovies,
    bool? hasMore,           // <-- Added hasMore to copyWith
    int? currentPage,        // <-- Added currentPage to copyWith
    String? error,
  }) =>
      MoviesState(
        query: query ?? this.query,
        isLoading: isLoading ?? this.isLoading,
        movies: movies ?? this.movies,
        favoriteMovies: favoriteMovies ?? this.favoriteMovies,
        watchedMovies: watchedMovies ?? this.watchedMovies,
        hasMore: hasMore ?? this.hasMore,   // <-- Set hasMore
        currentPage: currentPage ?? this.currentPage, // <-- Set currentPage
        error: error ?? this.error,
      );

  @override
  String toString() =>
      "MoviesState(query: $query, isLoading: $isLoading, movies: $movies, hasMore: $hasMore, currentPage: $currentPage)";

  @override
  operator ==(o) =>
      o is MoviesState &&
          o.query == query &&
          o.isLoading == isLoading &&
          o.error == error &&
          o.favoriteMovies == favoriteMovies &&
          o.watchedMovies == watchedMovies &&
          o.movies == movies &&
          o.hasMore == hasMore &&
          o.currentPage == currentPage;

  @override
  int get hashCode =>
      query.hashCode ^
      isLoading.hashCode ^
      movies.hashCode ^
      error.hashCode ^
      favoriteMovies.hashCode ^
      watchedMovies.hashCode ^
      hasMore.hashCode ^
      currentPage.hashCode;
}
