import 'package:dartz/dartz.dart';
import 'package:movies_app/Core/errors/exceptions.dart';
import 'package:movies_app/Movies/Movie/domain/entities/Movie.dart';
import 'package:movies_app/Movies/Movie/domain/repository/base_Movie_Repository.dart';
import '../../../../Core/errors/failure.dart';
import '../datasource/movie_remote_data_source.dart';

class MoivesRepository extends BaseMovieRepository {


  final BaseMovieRemoteDataSource remoteDataSource;


  MoivesRepository(this.remoteDataSource);


  Future <Either<Failure , List<Movie>>> fetchPlayingNowMovies() async {
    final result = await remoteDataSource.fetchPlayingNowMovies();
    try{
      return Right(result);
    } on ServerException catch(failure){
       return Left(ServerFailure(message: failure.errorMessageModel.statusmessage));
    }

  }

  @override
  Future <Either<Failure , List<Movie>>> fetchPopularMoviesPagination(int page) {
    // TODO: implement fetchPopularMoviesPagination
    throw UnimplementedError();
  }

  @override
  Future <Either<Failure , List<Movie>>> fetchTopRatedMovies() {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }
}