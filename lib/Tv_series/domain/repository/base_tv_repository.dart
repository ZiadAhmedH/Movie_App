import 'package:dartz/dartz.dart';

import '../../../Core/errors/failure.dart';
import '../entities/tv.dart';

abstract class BaseTvSeriesRepository {
  // remote methods
  Future <Either<Failure, List<Tv>>> fetchTrendingTvSeries();



}