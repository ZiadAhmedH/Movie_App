import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import '../../Hive_Database.dart';
import '../../Movie_Details_Cubit/Data/Local/movie_adapter.dart';
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
      hasMoreMovies = true;
      emit(MovieLoaded(movies: movies,
          hasMoreMovies: hasMoreMovies));
      print('Fetched ${movies.length} movies. Current page: $currentPage'); // Debugging print
    } catch (e) {
      emit(MovieError(e.toString()));
      print('Error fetching movies: $e'); // Debugging print
    }
  }

  Future<void> fetchMorePopularMovies() async {
    if (isLoading || !hasMoreMovies) return; // Prevent further requests if already loading or no more movies

    isLoading = true;
    try {
      // Fetch the next page of popular movies
      final newMovies = await _movieRepository.fetchPopularMoviesPagination(currentPage);

      if (newMovies.isNotEmpty) {
        // Increment page and check if more movies are available
        currentPage++;
        hasMoreMovies = newMovies.length == 20;

        // Get the list of favorite movie IDs from Hive
        final favoritesBox = await HiveDatabase.openBox<HiveMovie>('favoritesBox');
        final favoriteIds = favoritesBox.keys.cast<int>().toSet();

        // Set `isFav` for movies that are in the favorites list
        final updatedMovies = newMovies.map((movie) =>
            movie.copyWith(isFav: favoriteIds.contains(movie.id))
        ).toList();

        // Emit the new state if the current state is `MovieLoaded`
        if (state is MovieLoaded) {
          final currentState = state as MovieLoaded;
          emit(MovieLoaded(
            movies: List.of(currentState.movies)..addAll(updatedMovies),
            hasMoreMovies: hasMoreMovies,
          ));
        } else {
          // If the initial state wasn't MovieLoaded, initialize with the new movies list
          emit(MovieLoaded(
            movies: updatedMovies,
            hasMoreMovies: hasMoreMovies,
          ));
        }

        print('Loaded ${newMovies.length} more movies. Current page: $currentPage');
      } else {
        // Set `hasMoreMovies` to false if no movies were fetched
        hasMoreMovies = false;
        print('No more movies available on page $currentPage');
      }
    } catch (e) {
      print('Error loading more movies: $e');
    } finally {
      // Reset loading state regardless of success or failure
      isLoading = false;
    }
  }

  void getRandomMovies() async {
    emit(MovieLoading());
    try {
      final movies = await _movieRepository.fetchPopularMovies();

       final random = Random();
       final randomMovie = movies[random.nextInt(movies.length)];
       print(randomMovie);

      emit(MovieLoaded(randomMovie: randomMovie, movies: movies, hasMoreMovies: false));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }


}
