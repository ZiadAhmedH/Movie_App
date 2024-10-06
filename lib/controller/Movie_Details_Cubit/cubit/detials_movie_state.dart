// Base class for movie details state
import '../../Movie/Data/Models/Movie_Model.dart';

abstract class MovieDetailsState {
  final List<Movie> favoriteList; // List of favorite movies
  final List<Movie> watchedList;   // List of watched movies

  // Constructor
  MovieDetailsState({
    this.favoriteList = const [],
    this.watchedList = const [],
  });

  MovieDetailsState copyWith({
    List<Movie>? favoriteList,
    List<Movie>? watchedList,
  });
}

// Loading state
class MoviesDetailsLoading extends MovieDetailsState {
  MoviesDetailsLoading() : super();

  @override
  MovieDetailsState copyWith({List<Movie>? favoriteList, List<Movie>? watchedList}) {
    // In the loading state, `copyWith` should probably return the same loading state
    // without accepting favorite or watched list updates, since data isn't loaded yet
    return MoviesDetailsLoading();
  }
}

// Error state
class MoviesDetailsError extends MovieDetailsState {
  final String message;

  MoviesDetailsError(this.message) : super();

  MoviesDetailsError copyWith({List<Movie>? favoriteList, List<Movie>? watchedList}) {
    // In the error state, we should return the same error state with the error message
    return MoviesDetailsError(message);
  }
}

// Loaded state with movie details
class MoviesDetailsLoaded extends MovieDetailsState {
  final Movie movie;             // The movie details
  final bool isFavorite;         // Whether the movie is marked as favorite
  final bool isWatched;          // Whether the movie is marked as watched

  // Constructor
  MoviesDetailsLoaded({
    required this.movie,
    required this.isFavorite,
    required this.isWatched,
    List<Movie>? favoriteList,  // List of favorite movies
    List<Movie>? watchedList,    // List of watched movies
  }) : super(
    favoriteList: favoriteList ?? [],
    watchedList: watchedList ?? [],
  );

  @override
  MoviesDetailsLoaded copyWith({
    Movie? movie,
    bool? isFavorite,
    bool? isWatched,
    List<Movie>? favoriteList,
    List<Movie>? watchedList,
  }) {
    // Return a new instance of MoviesDetailsLoaded with updated values
    return MoviesDetailsLoaded(
      movie: movie ?? this.movie, // Keep current movie if not provided
      isFavorite: isFavorite ?? this.isFavorite, // Update isFavorite if provided
      isWatched: isWatched ?? this.isWatched, // Update isWatched if provided
      favoriteList: favoriteList ?? this.favoriteList, // Update favoriteList if provided
      watchedList: watchedList ?? this.watchedList, // Update watchedList if provided
    );
  }
}
