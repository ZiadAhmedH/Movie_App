import 'package:dartz/dartz.dart';

import 'package:movies_app/Core/errors/failure.dart';
import 'package:movies_app/Movies/Movie/Data/Models/fav_movie_model.dart';

import '../../../../../Core/usecase/base_Use_Case.dart';
import '../../repository/base_Movie_Repository.dart';

class SaveFavMovie   {
  final BaseMovieRepository _repository;

  SaveFavMovie(this._repository);

  Future<Either<Exception, void>> call(FavoriteMovieModel params) async {
    return await _repository.saveFavoriteMovie(params);
  }


}