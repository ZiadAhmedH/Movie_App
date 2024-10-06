import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/Data/Repo/Movie_Details_Repo.dart';
import '../../Movie/Data/Models/Movie_Model.dart';
import 'detials_movie_state.dart';

class MoviesDetailsCubit extends Cubit<DetailsMovieState> {

  final MovieDetailsRepo _moviedetailsRepo = GetIt.instance<MovieDetailsRepo>();

   MoviesDetailsCubit() : super(DetailsMovieStateInitial());


  Future<void> getMovieDetails(int movieId) async {
    emit(DetailsMovieStateLoading());
    try {
      final movieDetails = await _moviedetailsRepo.getMovieDetails(movieId);
      emit(DetailsMovieStateLoaded(movieDetails: movieDetails));
    } catch (e) {
      emit(DetailsMovieStateError(error: e.toString()));
    }
  }







}