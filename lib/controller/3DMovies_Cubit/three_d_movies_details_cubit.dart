import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/models/Movie_Model.dart';
import '../Movies_Repo.dart';

part 'three_d_movies_details_state.dart';

class ThreeDMoviesDetailsCubit extends Cubit<ThreeDMoviesDetailsState> {
  ThreeDMoviesDetailsCubit(int movieId , this._repo) : super(ThreeDMoviesDetailsLoading()) {
    fetch3dMovieDetails(movieId);

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

  void fetch3dMovieDetails(int movieId) {
    final movie = _repo.get3DMovieById(movieId);
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

