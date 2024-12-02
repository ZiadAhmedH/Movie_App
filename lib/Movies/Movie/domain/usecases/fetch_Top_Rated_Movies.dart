import '../entities/Movie.dart';
import '../repository/base_Movie_Repository.dart';

class FetchTopRatedMovies {
  final BaseMovieRepository _movieRepository;

  // inject the MovieRepository dependency  in Solid Principle way
  // we can also use GetIt package to do this
  // to separate the data layer from the domain layer
  FetchTopRatedMovies(this._movieRepository);

  Future<List<Movie>> call() async {
    return await _movieRepository.fetchTopRatedMovies();
  }
}