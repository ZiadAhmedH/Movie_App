import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/Movie/domain/entities/cast_movie.dart';
import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';
import 'package:movies_app/Movies/Movie/domain/entities/recommendation_movie.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/remote/fetch_Movie_Details.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/remote/fetch_Popular_Movies_Pagination.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/remote/fetch_Recommendation_Movies.dart';
import '../../../../Core/errors/failure.dart';
import '../../Data/Models/fav_movie_model.dart';
import '../entities/Movie.dart';
import '../usecases/remote/fetch_Movie_cast.dart';

abstract class BaseMovieRepository {
  // remote methods
  Future <Either<Failure , List<Movie>>> fetchTopRatedMovies();
  Future <Either<Failure , List<Movie>>> fetchPopularMoviesPagination(PopularMoviesPaginationParams params);
  Future <Either<Failure , List<Movie>>> fetchPlayingNowMovies();
  Future <Either<Failure ,MovieDetails>> fetchMovieDetails(MovieDetailsParams params);
  Future <Either<Failure , List<Recommendation>>> fetchRecommendationMovies(RecommendationParams params);
  Future <Either<Failure , List<Cast>>> fetchMovieCast(CastParams params);

// local methods
  Future<Either<Exception, void>> saveFavoriteMovie(FavoriteMovieModel movie);
  Future<Either<Exception, List<FavoriteMovieModel>>> getFavoriteMovies();
  Future<Either<Exception, void>> removeFavoriteMovie(int movieId);
  Future<Either<Exception, bool>> isMovieFavorite(int movieId);






}
