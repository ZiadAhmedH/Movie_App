import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../Data/Repo/Movies_Repo.dart';
import 'Movie_State.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository = GetIt.instance<MovieRepository>();
  int currentPage = 1;
  bool hasMoreMovies = true;
  bool isLoading = false;

  MovieCubit() : super(MovieInitial());

  Future<void> fetchPopularMovies() async {
    emit(MovieLoading());
    try {
      final movies = await _movieRepository.fetchPopularMoviesPagination(currentPage);
      currentPage++;
      hasMoreMovies = movies.length == 20; // Check if more movies are available
      emit(MovieLoaded(movies: movies, hasMoreMovies: hasMoreMovies));
      print('Fetched ${movies.length} movies. Current page: $currentPage'); // Debugging print
    } catch (e) {
      emit(MovieError(e.toString()));
      print('Error fetching movies: $e'); // Debugging print
    }
  }

  Future<void> fetchMorePopularMovies() async {
    if (!isLoading && hasMoreMovies) {
      isLoading = true;
      try {
        final newMovies = await _movieRepository.fetchPopularMoviesPagination(currentPage);
        if (newMovies.isNotEmpty) {
          currentPage++;
          hasMoreMovies = newMovies.length == 20; // Check if more movies are available

          final currentState = state as MovieLoaded;
          emit(MovieLoaded(
            movies: List.of(currentState.movies)..addAll(newMovies),
            hasMoreMovies: hasMoreMovies,
          ));
          print('Loaded ${newMovies.length} more movies. Current page: $currentPage'); // Debugging print
        } else {
          hasMoreMovies = false; // No more movies to load
          print('No more movies available on page $currentPage'); // Debugging print
        }
      } catch (e) {
        print('Error loading more movies: $e'); // Debugging print
      } finally {
        isLoading = false; // Reset loading state
      }
    }
  }
}
