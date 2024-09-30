import '../../model/models/Movie_Model.dart';

// Base class for movie details state
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
    return MoviesDetailsLoading();
  }
}

// Error state
class MoviesDetailsError extends MovieDetailsState {
  final String message;

  MoviesDetailsError(this.message) : super();

  @override
  MovieDetailsState copyWith({List<Movie>? favoriteList, List<Movie>? watchedList}) {
    return MoviesDetailsError(message);
  }
}

// Loaded state with movie details
class MoviesDetailsLoaded extends MovieDetailsState {
  final Movie movie;
  final bool isFavorite;
  final bool isWatched;

  MoviesDetailsLoaded({
    required this.movie,
    required this.isFavorite,
    required this.isWatched,
    List<Movie>? favoriteList,
    List<Movie>? watchedList,
  }) : super(favoriteList: favoriteList ?? [], watchedList: watchedList ?? []);

  @override
  MoviesDetailsLoaded copyWith({
    Movie? movie,
    bool? isFavorite,
    bool? isWatched,
    List<Movie>? favoriteList,
    List<Movie>? watchedList,
  }) {
    return MoviesDetailsLoaded(
      movie: movie ?? this.movie,
      isFavorite: isFavorite ?? this.isFavorite,
      isWatched: isWatched ?? this.isWatched,
      favoriteList: favoriteList ?? this.favoriteList,
      watchedList: watchedList ?? this.watchedList,
    );
  }
}
