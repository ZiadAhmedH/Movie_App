import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/exceptions.dart';
import 'package:movies_app/Movies/Movie/domain/entities/Movie.dart';
import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';
import 'package:movies_app/Movies/Movie/domain/repository/base_Movie_Repository.dart';
import '../../../../Core/errors/failure.dart';
import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource remoteDataSource;

  MoviesRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> fetchPlayingNowMovies() async {
    final result = await remoteDataSource.fetchPlayingNowMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusmessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> fetchPopularMoviesPagination(
      int page) async {
    final result = await remoteDataSource.fetchPopularMoviesPagination(page);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusmessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> fetchTopRatedMovies() async {
    final result = await remoteDataSource.fetchTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusmessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> fetchMovieDetails() {
    // TODO: implement fetchMovieDetails
    throw UnimplementedError();
  }
}
