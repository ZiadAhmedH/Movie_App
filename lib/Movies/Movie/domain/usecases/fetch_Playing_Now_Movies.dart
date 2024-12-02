import '../entities/Movie.dart';
import '../repository/base_Movie_Repository.dart';

class FetchPlayingNowMovies {
  final BaseMovieRepository _movieRepository;

  FetchPlayingNowMovies(this._movieRepository);

  Future<List<Movie>> call() async {
    return await _movieRepository.fetchPlayingNowMovies();
  }
}