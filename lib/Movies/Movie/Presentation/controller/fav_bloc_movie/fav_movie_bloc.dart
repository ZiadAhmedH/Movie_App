import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../Data/Models/fav_movie_model.dart';
import '../../../domain/usecases/local/get_fav_movies.dart';
import '../../../domain/usecases/local/save_fav_Movie.dart';
import '../../../Data/datasource/movie_local_data_source.dart';

part 'fav_movie_event.dart';
part 'fav_movie_state.dart';

class FavMovieBloc extends Bloc<FavMovieEvent, FavMovieState> {
  final GetFavMovies getFavMovies;
  final SaveFavMovie saveFavMovie;
  final MovieLocalDataSource movieLocalDataSource;

  FavMovieBloc(this.getFavMovies, this.saveFavMovie, this.movieLocalDataSource)
      : super(FavMovieInitial()) {

    // Load Favorite Movies
    on<FetchFavMoviesEvent>((event, emit) async {
      final result = await getFavMovies();
      result.fold(
            (l) => emit(FavMoviesError(l.toString())),
            (r) => emit(FavMoviesLoaded(r)),
      );
    });

    // Add Favorite Movie
    on<AddFavMovieEvent>((event, emit) async {
      final result = await saveFavMovie(event.favoriteMovieModel);
      result.fold(
            (l) => emit(FavMoviesError(l.toString())),
            (r) => emit(FavMovieAdded(event.favoriteMovieModel)),
      );
    });

    // Remove Favorite Movie
    on<RemoveFavMovieEvent>((event, emit) async {
      await movieLocalDataSource.removeFavoriteMovie(event.movieId);
      emit(FavMovieDeleted(event.movieId));
    });

    // Check if Movie is Favorite
    on<CheckIfMovieFavEvent>((event, emit) async {
      final isFavorite = await movieLocalDataSource.isMovieFavorite(event.movieId);
      if (isFavorite) {
        emit(FavMovieAdded(FavoriteMovieModel(id: event.movieId, title: "", posterPath: "")));
      } else {
        emit(FavMovieInitial());
      }
    });
  }
}
