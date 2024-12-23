import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failure.dart';
import '../entities/Movie.dart';
import '../repository/base_Movie_Repository.dart';
class FetchPopularMoviesPagination {
  final BaseMovieRepository _movieRepository;

  FetchPopularMoviesPagination(this._movieRepository);

  Future <Either<Failure , List<Movie>>> call(int currentPage) async {
    return await _movieRepository.fetchPopularMoviesPagination(currentPage);
  }
}