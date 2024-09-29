import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/controller/Repos/Movies_ThreeD_Repo.dart';
import 'package:movies_app/controller/ThreeDCubit/three_dcubit_state.dart';

import '../../model/models/Movie_Model.dart';
import '../Repos/Movies_Repo.dart';
import '../Shared_Cubit/favorites_and_watched_cubit.dart';

class ThreeDcubitCubit extends Cubit<ThreeDState> {

  final ThreeDMovieRepository threeDRepo;

  final FavoritesAndWatchedCubit favoritesCubit; // Inject shared favorites/watch cubit


  ThreeDcubitCubit(this.threeDRepo, this.favoritesCubit) : super(ThreeDState.initial());


  Future<void> fetchMoreMovies() async {
    if (!state.hasMoreMovies || state.isLoading) return;
    try {
      emit(state.copyWith(isLoading: true));
      final movies = await threeDRepo.fetchMovies(page: state.currentPage + 1);
      emit(state.copyWith(
        movies: state.movies.addAll(movies),
        isLoading: false,
        hasMoreMovies: threeDRepo.hasMorePages,
        currentPage: state.currentPage + 1,
      ));
      print("3D Movies fetched more .........");
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }


  // Fetch 3D movies when the app starts

  Future<void> fetchSample3DMovies() async {
    try {
      final movies = await threeDRepo.fetchMovies(page: 1);
      emit(state.copyWith(
        movies: movies ,
        isLoading: false,
        hasMoreMovies: threeDRepo.hasMorePages,
        currentPage: 1,

      ));
      print("3D Movies fetched");
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }


  void toggleFavorite(Movie movie) {
    if (favoritesCubit.state.favs.contains(movie)) {
      favoritesCubit.toggleFavorite(movie);
    } else {
      favoritesCubit.isWatched(movie);
    }
  }

  void markAsWatched(Movie movie) {
    if (favoritesCubit.state.watched.contains(movie)) {
      favoritesCubit.toggleWatched(movie);
    } else {
      favoritesCubit.toggleWatched(movie);
    }
  }






}
