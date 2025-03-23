import 'package:dartz/dartz.dart';
import '../../../../../Core/errors/failure.dart';
import '../../Data/Models/fav_movie_model.dart';
import '../entities/Movie.dart';
import '../entities/cast_movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation_movie.dart';
import '../usecases/remote/fetch_Movie_Details.dart';
import '../usecases/remote/fetch_Movie_cast.dart';
import '../usecases/remote/fetch_Popular_Movies_Pagination.dart';
import '../usecases/remote/fetch_Recommendation_Movies.dart';

abstract class BaseMovieRepository {
  // remote methods
  Future <Either<Failure , List<Movie>>> fetchTopRatedMovies();
  Future <Either<Failure , List<Movie>>> fetchPopularMoviesPagination(PopularMoviesPaginationParams params);
  Future <Either<Failure , List<Movie>>> fetchPlayingNowMovies();
  Future <Either<Failure ,MovieDetails>> fetchMovieDetails(MovieDetailsParams params);
  Future <Either<Failure , List<Recommendation>>> fetchRecommendationMovies(RecommendationParams params);
  Future <Either<Failure , List<Cast>>> fetchMovieCast(CastParams params);
  Future <Either<Failure , List<Movie>>> fetchSearchMovies(String query);
// local methods
  Future<Either<Exception, void>> saveFavoriteMovie(FavoriteMovieModel movie);
  Future<Either<Exception, List<FavoriteMovieModel>>> getFavoriteMovies();
  Future<Either<Exception, void>> removeFavoriteMovie(int movieId);
  Future<Either<Exception, bool>> isMovieFavorite(int movieId);






}
