import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/Movie/domain/entities/Movie.dart';

import '../../../../../Core/errors/failure.dart';
import '../../../../../Core/usecase/base_Use_Case.dart';
import '../../repository/base_Movie_Repository.dart';

class SearchMovieUseCase extends BaseUseCase<List<Movie>, String> {
  final BaseMovieRepository _repository;

  SearchMovieUseCase(this._repository);
  @override
  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await _repository.fetchSearchMovies(query);
  }
}