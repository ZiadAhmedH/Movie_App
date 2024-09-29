import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Repos/Movies_ThreeD_Repo.dart';
import 'package:movies_app/controller/Shared_Cubit/favorites_and_watched_cubit.dart';

import '../../model/models/Movie_Model.dart';
import '../Repos/Movies_Repo.dart';
import 'detials_movie_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(movie, this._repo, this._threeDRepo, this._sharedFavWatchedCubit) : super(MoviesDetailsLoading()) {
    fetchMovieDetails(movie);
    _repo.addListener(_repoStateChanged);
    _threeDRepo.addListener(_repoStateChanged);
  }

  final MoviesRepo _repo;

  final ThreeDMovieRepository _threeDRepo;

  final FavoritesAndWatchedCubit _sharedFavWatchedCubit;


  static MoviesDetailsCubit of(context) => BlocProvider.of<MoviesDetailsCubit>(context);

  void _repoStateChanged() {
    if (state is MoviesDetailsLoaded) {
      final movie = (state as MoviesDetailsLoaded).movie; // changed to by Movie Not by movieId i not sure by there is some duplication id between 3D and regular movies

      final isFavorite = _sharedFavWatchedCubit.isFavorite(movie);
      final isWatched = _sharedFavWatchedCubit.isWatched(movie);

      emit((state as MoviesDetailsLoaded).copyWith(
        isFavorite: isFavorite,
        isWatched: isWatched,
      ));
    }
  }



  void fetchMovieDetails(Movie movie) {
    final isFavorite = _sharedFavWatchedCubit.isFavorite(movie);
    final isWatched = _sharedFavWatchedCubit.isWatched(movie);

    emit(MoviesDetailsLoaded(movie, isFavorite, isWatched));
  }



  void toggleFavorite(Movie movie) {
    if (state is! MoviesDetailsLoaded) return;

    // Use the shared cubit to toggle favorite status
    _sharedFavWatchedCubit.toggleWatched(movie);
    emit((state as MoviesDetailsLoaded).copyWith(
      isFavorite: _sharedFavWatchedCubit.isFavorite(movie),
    ));
  }

  void toggleWatched(Movie movie) {
    if (state is! MoviesDetailsLoaded) return;

    // Use the shared cubit to toggle watched status
    _sharedFavWatchedCubit.toggleWatched(movie);
    emit((state as MoviesDetailsLoaded).copyWith(
      isWatched: _sharedFavWatchedCubit.isWatched(movie),
    ));
  }

  @override
  Future<void> close() {
    _repo.removeListener(_repoStateChanged);
    return super.close();
  }
}
