import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/usecase/base_Use_Case.dart';

import '../../../../../Core/errors/failure.dart';
import '../../entities/Movie.dart';
import '../../repository/base_Movie_Repository.dart';
class FetchPopularMoviesPagination extends BaseUseCase<List<Movie>, PopularMoviesPaginationParams> {
  final BaseMovieRepository _movieRepository;

  FetchPopularMoviesPagination(this._movieRepository);

  @override
  Future <Either<Failure , List<Movie>>> call(PopularMoviesPaginationParams popularMovieParams) async {
    return await _movieRepository.fetchPopularMoviesPagination(popularMovieParams);
  }
}

class PopularMoviesPaginationParams {
  final int currentPage;
  PopularMoviesPaginationParams(this.currentPage);
}