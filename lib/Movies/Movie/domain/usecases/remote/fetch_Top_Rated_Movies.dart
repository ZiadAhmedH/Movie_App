import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/usecase/base_Use_Case.dart';

import '../../../../../Core/errors/failure.dart';
import '../../entities/Movie.dart';
import '../../repository/base_Movie_Repository.dart';

class FetchTopRatedMovies extends BaseUseCase<List<Movie>, NoParams> {
  final BaseMovieRepository _movieRepository;

  FetchTopRatedMovies(this._movieRepository);

  @override
  Future <Either<Failure , List<Movie>>> call(NoParams noParams) async {
    return await _movieRepository.fetchTopRatedMovies();
  }
}