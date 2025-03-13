import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';
import 'package:movies_app/Movies/Movie/domain/entities/recommendation_movie.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/fetch_Movie_Details.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/fetch_Popular_Movies_Pagination.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/fetch_Recommendation_Movies.dart';
import '../../../../Core/errors/failure.dart';
import '../entities/Movie.dart';

abstract class BaseMovieRepository {

  Future <Either<Failure , List<Movie>>> fetchTopRatedMovies();
  Future <Either<Failure , List<Movie>>> fetchPopularMoviesPagination(PopularMoviesPaginationParams params);
  Future <Either<Failure , List<Movie>>> fetchPlayingNowMovies();
  Future <Either<Failure ,MovieDetails>> fetchMovieDetails(MovieDetailsParams params);
  Future <Either<Failure , List<Recommendation>>> fetchRecommendationMovies(RecommendationParams params);

}
