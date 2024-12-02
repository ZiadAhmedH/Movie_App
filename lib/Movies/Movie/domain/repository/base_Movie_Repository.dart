
import '../entities/Movie.dart';

abstract class BaseMovieRepository {
Future<List<Movie>> fetchTopRatedMovies();
Future<List<Movie>> fetchPopularMoviesPagination(int page);
Future<List<Movie>> fetchPlayingNowMovies();

}
