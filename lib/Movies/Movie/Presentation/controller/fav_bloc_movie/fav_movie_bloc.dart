import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../Core/Constents/enums.dart';
import '../../../Data/Models/fav_movie_model.dart';
import '../../../domain/usecases/local/get_fav_movies.dart';
import '../../../domain/usecases/local/save_fav_Movie.dart';
import '../../../Data/datasource/movie_local_data_source.dart';
import 'fav_movie_state.dart';

part 'fav_movie_event.dart';


class FavMovieBloc extends Bloc<FavMovieEvent, FavMovieState> {
  final GetFavMovies getFavMovies;
  final SaveFavMovie saveFavMovie;
  final MovieLocalDataSource movieLocalDataSource;

  FavMovieBloc(this.getFavMovies, this.saveFavMovie, this.movieLocalDataSource)
      : super(const FavMovieState()) {

    on<FetchFavMoviesEvent>((event, emit) async {
      final result = await getFavMovies();
      result.fold(
            (l) => emit(state.copyWith(favMoviesState: RequestState.error, favMoviesMessage: l.toString())),
            (r) => emit(state.copyWith(favoriteMovies: r, favMoviesState: RequestState.loaded)),
      );
    });

    on<AddFavMovieEvent>((event, emit) async {
      await movieLocalDataSource.saveFavoriteMovie(event.favoriteMovieModel);

      final updatedList = List<FavoriteMovieModel>.from(state.favoriteMovies)
        ..add(event.favoriteMovieModel);

      emit(state.copyWith(favoriteMovies: updatedList));

      final newList = await movieLocalDataSource.getFavoriteMovies();
      emit(state.copyWith(favoriteMovies: newList));
    });

    on<RemoveFavMovieEvent>((event, emit) async {
      await movieLocalDataSource.removeFavoriteMovie(event.movieId);

      final updatedList = state.favoriteMovies
          .where((movie) => movie.id != event.movieId)
          .toList();

      emit(state.copyWith(favoriteMovies: updatedList));

      final newList = await movieLocalDataSource.getFavoriteMovies();
      emit(state.copyWith(favoriteMovies: newList));
    });

    on<CheckIfMovieFavEvent>((event, emit) async {
      final isFavorite = await movieLocalDataSource.isMovieFavorite(event.movieId);
      emit(state.copyWith(isFavorite: isFavorite));
    });
  }
}
