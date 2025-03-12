import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';
import '../../../../Core/errors/failure.dart';
import '../entities/Movie.dart';

abstract class BaseMovieRepository {

  Future <Either<Failure , List<Movie>>> fetchTopRatedMovies();
  Future <Either<Failure , List<Movie>>> fetchPopularMoviesPagination(int page);
  Future <Either<Failure , List<Movie>>> fetchPlayingNowMovies();
  Future <Either<Failure ,MovieDetails>> fetchMovieDetails();

}
