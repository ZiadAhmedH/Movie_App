import 'package:equatable/equatable.dart';
import '../../../../../Core/Constents/enums.dart';
import '../../../Data/Models/fav_movie_model.dart';

class FavMovieState extends Equatable {
  const FavMovieState({
    this.favoriteMovies = const [],
    this.favMoviesState = RequestState.idle,
    this.favMoviesMessage = '',
    this.addedMovie,
    this.deletedMovieId,
    this.isFavorite = false,
  });

  final List<FavoriteMovieModel> favoriteMovies;
  final RequestState favMoviesState;
  final String favMoviesMessage;
  final FavoriteMovieModel? addedMovie;
  final int? deletedMovieId;
  final bool isFavorite;

  FavMovieState copyWith({
    List<FavoriteMovieModel>? favoriteMovies,
    RequestState? favMoviesState,
    String? favMoviesMessage,
    FavoriteMovieModel? addedMovie,
    int? deletedMovieId,
    bool? isFavorite,
  }) {
    return FavMovieState(
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      favMoviesState: favMoviesState ?? this.favMoviesState,
      favMoviesMessage: favMoviesMessage ?? this.favMoviesMessage,
      addedMovie: addedMovie ?? this.addedMovie,
      deletedMovieId: deletedMovieId ?? this.deletedMovieId,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    favoriteMovies,
    favMoviesState,
    favMoviesMessage,
    addedMovie,
    deletedMovieId,
    isFavorite,
  ];
}
