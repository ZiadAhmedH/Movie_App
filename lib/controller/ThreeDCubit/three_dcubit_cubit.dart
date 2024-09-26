import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/controller/ThreeDCubit/three_dcubit_state.dart';

import '../Movies_Repo.dart';

class ThreeDcubitCubit extends Cubit<ThreeDState> {

  final MoviesRepo moviesRepo;


  ThreeDcubitCubit(this.moviesRepo) : super(ThreeDState.initial());


  Future<void> fetchMoreMovies() async {
    if (!state.hasMoreMovies || state.isLoading) return;
    try {
      emit(state.copyWith(isLoading: true));
      final movies = await moviesRepo.fetch3DMovies(page: state.currentPage + 1);
      emit(state.copyWith(
        movies: state.movies.addAll(movies),
        isLoading: false,
        hasMoreMovies: moviesRepo.hasMorePages,
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
      final movies = await moviesRepo.fetch3DMovies(page: 1);
      emit(state.copyWith(
        movies: movies ,
        isLoading: false,
        hasMoreMovies: moviesRepo.hasMorePages,
        currentPage: 1,

      ));
      print("3D Movies fetched");
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }



}
