import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/models/Movie_Model.dart';
import '../Movies_Repo.dart';
import 'detials_movie_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(movie, this._repo) : super(MoviesDetailsLoading()) {
    fetchMovieDetails(movie);
    _repo.addListener(_repoStateChanged);
  }

  final MoviesRepo _repo;

  static MoviesDetailsCubit of(context) => BlocProvider.of<MoviesDetailsCubit>(context);

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

  void fetchMovieDetails(Movie movie) {
    if (movie.is3DMovie) {
      _fetch3dMovieDetails(movie);
    } else {
      _fetchRegularMovieDetails(movie);
    }
  }

  void _fetchRegularMovieDetails(Movie movie) {
    final isFavorite = _repo.isFavorite(movie.id);
    final isWatched = _repo.isWatched(movie.id);

    emit(MoviesDetailsLoaded(movie, isFavorite, isWatched));
  }

  void _fetch3dMovieDetails(Movie movie) {
    final isFavorite = _repo.isFavorite(movie.id);
    final isWatched = _repo.isWatched(movie.id);

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
