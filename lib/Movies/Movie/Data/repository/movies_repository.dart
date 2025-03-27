import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/exceptions.dart';
import 'package:movies_app/Movies/Movie/Data/Models/fav_movie_model.dart';
import 'package:movies_app/Movies/Movie/domain/entities/Movie.dart';
import 'package:movies_app/Movies/Movie/domain/entities/cast_movie.dart';
import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';
import 'package:movies_app/Movies/Movie/domain/entities/recommendation_movie.dart';
import 'package:movies_app/Movies/Movie/domain/repository/base_Movie_Repository.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/remote/fetch_Movie_Details.dart';

import 'package:movies_app/Movies/Movie/domain/usecases/remote/fetch_Recommendation_Movies.dart';
import '../../../../Core/errors/failure.dart';
import '../../domain/entities/video.dart';
import '../../domain/usecases/remote/fetch_Movie_Video.dart';
import '../../domain/usecases/remote/fetch_Movie_cast.dart';
import '../../domain/usecases/remote/fetch_Popular_Movies_Pagination.dart';
import '../datasource/movie_local_data_source.dart';
import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;

  MoviesRepository(this.remoteDataSource , this.localDataSource);

  @override
  Future<Either<Failure, List<Movie>>> fetchPlayingNowMovies() async {
    final result = await remoteDataSource.fetchPlayingNowMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> fetchPopularMoviesPagination(PopularMoviesPaginationParams params) async {
    final result = await remoteDataSource.fetchPopularMoviesPagination(PopularMoviesPaginationParams(1));

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> fetchTopRatedMovies() async {
    final result = await remoteDataSource.fetchTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(MovieDetailsParams params)async {
     final result = await remoteDataSource.fetchMovieDetails(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> fetchRecommendationMovies(RecommendationParams params)async {
    final result = await remoteDataSource.fetchRecommendationMovies(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Cast>>> fetchMovieCast(CastParams params)async {

    final result =await remoteDataSource.fetchMovieCast(params);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Exception, List<FavoriteMovieModel>>> getFavoriteMovies()async {
   try {
     final result = await localDataSource.getFavoriteMovies();
      return Right(result);
    } on Exception catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Exception, bool>> isMovieFavorite(int movieId)async {
    try {
      final isFavorite = await localDataSource.isMovieFavorite(movieId);
      return Right(isFavorite);
    } on Exception catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Exception, void>> removeFavoriteMovie(int movieId)async {

    try {
      final result = localDataSource.removeFavoriteMovie(movieId);
      return Right(result);
    } on Exception catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Exception, void>> saveFavoriteMovie(FavoriteMovieModel movie)async {

    try {
      final result = localDataSource.saveFavoriteMovie(FavoriteMovieModel(
        id: movie.id!,
        title: movie.title!,
        posterPath: movie.posterPath!,
      ));
      return Right(result);
    } on Exception catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> fetchSearchMovies(String query)async {

    try {
      final result = await remoteDataSource.fetchSearchMovies(query);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Video>> fetchMovieVideo(MovieVideoParams params)async {
    try {
      final result = await remoteDataSource.fetchMovieVideo(params);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
  


}
