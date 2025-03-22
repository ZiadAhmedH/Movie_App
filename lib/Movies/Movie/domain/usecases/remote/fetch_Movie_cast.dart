import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/failure.dart';
import 'package:movies_app/Core/usecase/base_Use_Case.dart';

import '../../entities/cast_movie.dart';
import '../../repository/base_Movie_Repository.dart';



class FetchMovieCast extends BaseUseCase<List<Cast> ,CastParams >{
  final BaseMovieRepository _movieRepository;

  FetchMovieCast(this._movieRepository);


  @override
  Future<Either<Failure, List<Cast>>> call(CastParams params) async {

    return await _movieRepository.fetchMovieCast(params);

    }

}

class CastParams {
  final int movieId;

  CastParams({required this.movieId});
}