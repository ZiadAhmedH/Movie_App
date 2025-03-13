import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/usecase/base_Use_Case.dart';
import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';
import 'package:movies_app/Movies/Movie/domain/repository/base_Movie_Repository.dart';

import '../../../../Core/errors/failure.dart';

class FetchMovieDetailsUseCase extends BaseUseCase<MovieDetails ,MovieDetailsParams > {
 final BaseMovieRepository _movieRepository;

  FetchMovieDetailsUseCase(this._movieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParams movieParams) async {
    return await _movieRepository.fetchMovieDetails(movieParams);
   }
}


class MovieDetailsParams {
  final int movieId;

  MovieDetailsParams(this.movieId);
}