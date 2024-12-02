import '../entities/Movie.dart';
import '../repository/Movies_Repo.dart';

class FetchPopularMoviesPagination {
  final MovieRepository _movieRepository;

  FetchPopularMoviesPagination(this._movieRepository);

  Future<List<Movie>> call(int currentPage) async {
    return await _movieRepository.fetchPopularMoviesPagination(currentPage);
  }
}