import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/controller/ThreeDMovies/Repo/Movies_ThreeD_Repo.dart';
import 'package:movies_app/controller/ThreeDMovies/cubit/three_dcubit_state.dart';

class ThreeDcubitCubit extends Cubit<ThreeDState> {

  final ThreeDMovieRepository _threeDRepo = GetIt.instance<ThreeDMovieRepository>();

  ThreeDcubitCubit() : super(ThreeDState.initial());


  Future<void> fetchMoreMovies() async {
    if (!state.hasMoreMovies || state.isLoading) return;
    try {
      emit(state.copyWith(isLoading: true));
      final movies = await _threeDRepo.fetchMovies(page: state.currentPage + 1);
      emit(state.copyWith(
        movies: state.movies.addAll(movies),
        isLoading: false,
        hasMoreMovies: _threeDRepo.hasMorePages,
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
      final movies = await _threeDRepo.fetchMovies(page: 1);
      emit(state.copyWith(
        movies: movies ,
        isLoading: false,
        hasMoreMovies: _threeDRepo.hasMorePages,
        currentPage: 1,

      ));
      print("3D Movies fetched");
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }








}
