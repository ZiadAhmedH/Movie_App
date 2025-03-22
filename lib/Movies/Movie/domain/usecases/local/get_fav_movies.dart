import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/Movie/Data/Models/fav_movie_model.dart';

import '../../repository/base_Movie_Repository.dart';

class GetFavMovies {
  final BaseMovieRepository _repository;

  GetFavMovies(this._repository);

  Future<Either<Exception, List<FavoriteMovieModel>>> call() async {
    return await _repository.getFavoriteMovies();
  }
}