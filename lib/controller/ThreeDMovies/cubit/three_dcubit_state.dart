import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../model/models/Movie_Model.dart';
import '../../commenMovieState.dart';

class ThreeDState implements MovieStateInterface {
  final IList<Movie> movies;
  final bool hasMoreMovies;
  final bool isLoading;
  final String? error;
  final int currentPage; // Add currentPage property

  ThreeDState({
    required this.movies,
    required this.hasMoreMovies,
    required this.isLoading,
    this.error,
    required this.currentPage, // Include currentPage in constructor
  });

  // Initial state (when nothing is loaded yet)
  factory ThreeDState.initial() {
    return ThreeDState(
      movies: IList([]),
      hasMoreMovies: true,
      isLoading: false,
      error: null,
      currentPage: 0, // Set initial value for currentPage
    );
  }

  // Copy method for immutability
  ThreeDState copyWith({
    IList<Movie>? movies,
    bool? hasMoreMovies,
    bool? isLoading,
    String? error,
    int? currentPage, // Add currentPage to copyWith method
  }) {
    return ThreeDState(
      movies: movies ?? this.movies,
      hasMoreMovies: hasMoreMovies ?? this.hasMoreMovies,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentPage: currentPage ?? this.currentPage, // Include currentPage in new state
    );
  }
}
