import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/usecase/base_Use_Case.dart';

import '../../../../../../Core/errors/failure.dart';
import '../../entities/recommendation_movie.dart';
import '../../repository/base_Movie_Repository.dart';


class FetchRecommendationMovies
    extends BaseUseCase<List<Recommendation>, RecommendationParams> {
  final BaseMovieRepository _movieRepository;

  FetchRecommendationMovies(this._movieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParams params) async {
    return await _movieRepository.fetchRecommendationMovies(params);
  }
}

class RecommendationParams extends Equatable {
  final int id;

  const RecommendationParams(this.id);

  @override
  List<Object?> get props => [id];
}
