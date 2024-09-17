import 'package:bloc/bloc.dart';

import '../Movies_Repo.dart';
import 'detials_movie_state.dart';



class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(int movieId, this._repo) : super(MoviesDetailsLoading()) {
    fetchMovieDetails(movieId);
    _repo.addListener(_repoStateChanged);
  }

  final MoviesRepo _repo;

  void _repoStateChanged() {
    if (state is MoviesDetailsLoaded) {
      emit(
        (state as MoviesDetailsLoaded).copyWith(
          isFavorite: _repo.isFavorite((state as MoviesDetailsLoaded).movie.id),
          isWatched: _repo.isWatched((state as MoviesDetailsLoaded).movie.id),
        ),
      );
    }
  }

  void fetchMovieDetails(int movieId) {
    final movie = _repo.getMovieById(movieId);
    if (movie == null) {
      emit(MoviesDetailsError("Movie not found"));
      return;
    }

    final isFavorite = _repo.isFavorite(movieId);
    final isWatched = _repo.isWatched(movieId);

    emit(MoviesDetailsLoaded(movie, isFavorite, isWatched));
  }

  void toggleFavorite(int movieId) {
    if (state is! MoviesDetailsLoaded) return;
    _repo.toggleFavorite(movieId);
    emit((state as MoviesDetailsLoaded)
        .copyWith(isFavorite: _repo.isFavorite(movieId)));
  }

  void toggleWatched(int movieId) {
    if (state is! MoviesDetailsLoaded) return;
    _repo.toggleWatched(movieId);
    emit((state as MoviesDetailsLoaded)
        .copyWith(isWatched: _repo.isWatched(movieId)));
  }

  @override
  Future<void> close() {
    _repo.removeListener(_repoStateChanged);
    return super.close();
  }
}