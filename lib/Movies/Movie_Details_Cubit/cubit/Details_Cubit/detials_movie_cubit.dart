import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../Movie/Data/Models/Movie_Model.dart';
import '../../Data/Local/movie_adapter.dart';
import '../../Data/Local/movie_dao.dart';
import '../../Data/Repo/Movie_Details_Repo.dart';
import 'detials_movie_state.dart';

class MoviesDetailsCubit extends Cubit<DetailsMovieState> {
  final MovieDetailsRepo _moviedetailsRepo = GetIt.instance<MovieDetailsRepo>();

  final MovieDao  _movieDao =  GetIt.instance<MovieDao>();

  MoviesDetailsCubit() : super(DetailsMovieStateInitial());

  Future<void> getMovieDetails(int movieId) async {
    emit(DetailsMovieStateLoading());
    try {
      final movieDetails = await _moviedetailsRepo.getMovieDetails(movieId);
      emit(DetailsMovieStateLoaded(movieDetails: movieDetails , isFav: await _movieDao.isFavorite(movieId)));
    } catch (e) {
      emit(DetailsMovieStateError(error: e.toString()));
    }
  }

  Future<void> toggleFavorite(Movie movie) async {
    try {
      final isCurrentlyFavorite = await _movieDao.isFavorite(movie.id);
      if (isCurrentlyFavorite) {
        await _movieDao.removeFromFavorites(movie.id);
        emit(DetailsMovieStateLoaded(movieDetails: (state as DetailsMovieStateLoaded).movieDetails.copyWith(isFav: false), isFav: false));
      } else {
        await _movieDao.addToFavorites(HiveMovie(id: movie.id, title: movie.title.toString(), overview: movie.overview.toString()));
      }
      final updatedMovieDetails = (state as DetailsMovieStateLoaded).movieDetails.copyWith(isFav: !isCurrentlyFavorite);
      emit(DetailsMovieStateLoaded(movieDetails: updatedMovieDetails, isFav: !isCurrentlyFavorite));
    } catch (e) {
      emit(DetailsMovieStateError(error: e.toString()));
    }
  }

  Future<bool> isFavorite(int movieId) async {
    return await _movieDao.isFavorite(movieId);
  }
}

