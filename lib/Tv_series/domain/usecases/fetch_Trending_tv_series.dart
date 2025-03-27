import 'package:dartz/dartz.dart';

import '../../../Core/errors/failure.dart';
import '../../../Core/usecase/base_Use_Case.dart';
import '../entities/tv.dart';
import '../repository/base_tv_repository.dart';

class FetchTrendingTvSeriesUseCase extends BaseUseCase<List<Tv>, NoParams> {
  final BaseTvSeriesRepository repository;

  FetchTrendingTvSeriesUseCase(this.repository);
  @override
  Future<Either<Failure, List<Tv>>> call(NoParams noParams) async {
    return await repository.fetchTrendingTvSeries();
  }
}