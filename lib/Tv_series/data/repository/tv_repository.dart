import 'package:dartz/dartz.dart';

import '../../../Core/errors/exceptions.dart';
import '../../../Core/errors/failure.dart';
import '../../domain/entities/tv.dart';
import '../datasource/tv_remote_data_source.dart';

class TvSeriesRepository {
  final TvRemoteDataSource remoteDataSource;

  TvSeriesRepository({
    required this.remoteDataSource,
  });

  Future<Either<Failure, List<Tv>>> fetchTrendingTvSeries() async {
    try {
      final tvSeries = await remoteDataSource.fetchTrendingTvSeries();
      return Right(tvSeries);
    } on ServerException  catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }


}