import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Data/Models/fav_movie_model.dart';
import '../../../domain/usecases/local/get_fav_movies.dart';
import '../../../domain/usecases/local/save_fav_Movie.dart';

part 'fav_movie_event.dart';
part 'fav_movie_state.dart';

class FavMovieBloc extends Bloc<FavMovieEvent, FavMovieState> {
  final GetFavMovies getFavMovies;
  final SaveFavMovie saveFavMovie;
  FavMovieBloc(this.getFavMovies , this.saveFavMovie) : super(FavMovieInitial()) {
    on<FetchFavMoviesEvent>((event, emit)async {
      final result = await getFavMovies();
      result.fold(
        (l) => emit(FavMoviesError(l.toString())),
        (r) => emit(FavMoviesLoaded(r)),
      );
    });

    on<AddFavMovieEvent>((event, emit)async {
      final result = await saveFavMovie(event.favoriteMovieModel);
      result.fold(
        (l) => emit(FavMoviesError(l.toString())),
        (r) => emit(FavMovieAdded(event.favoriteMovieModel)),
      );
    });
  }
}
