import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import '../model/models/Movie_Model.dart';
import 'Movie_State.dart';
import 'Movies_Repo.dart';

class MovieCubit extends Cubit<MoviesState> {
  final MoviesRepo _repo;
  final Dio _dio = Dio();

  MovieCubit(this._repo) : super(MoviesState.initial()) {
    _repo.addListener(_repoStateChanged);
  }

  void _repoStateChanged() {
    emit(state.copyWith(
      favoriteMovies: _repo.favoriteMovies,
      watchedMovies: _repo.watchedMovies,
    ));
  }

  // Fetch movies with pagination
  void fetchMovies({int page = 1}) async {
    if (state.isLoading) return; // Prevent multiple calls during loading

    emit(state.copyWith(isLoading: true)); // Set loading state

    try {
      final res = await _dio.get(
        "https://yts.mx/api/v2/list_movies.json",
        queryParameters: {"page": page},
      );

      final newMovies = (res.data["data"]["movies"] as Iterable<dynamic>)
          .map((i) => Movie(
        title: i["title"],
        imageUrl: i["large_cover_image"],
        isFavorite: false,
        id: i["id"],
        backgroundImageUrl: i["background_image"],
        year: i["year"],
        rating: i["rating"].toDouble(),
        runtime: i["runtime"],
        isWatched: false,
      ))
          .toList();

      // If there are no more movies to load
      if (newMovies.isEmpty) {
        emit(state.copyWith(
          movies: IList<Movie>(),
          favoriteMovies: IList<Movie>(),
          watchedMovies: IList<Movie>(),
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(
          movies: state.movies.addAll(newMovies),
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: "Error fetching movies: $e",
      ));
    }
  }

  // Add a movie manually
  void addMovie(Movie movie) {
    if (!state.movies.contains(movie)) {
      final updatedMovies = state.movies.add(movie);
      emit(state.copyWith(movies: updatedMovies));
    }
  }

  // Remove a movie manually
  void removeMovie(Movie movie) {
    final updatedMovies = state.movies.remove(movie);
    emit(state.copyWith(movies: updatedMovies));
  }

  // Toggle favorite status of a movie
  void toggleFavorite(Movie movie) {
    final updatedMovie = movie.copyWith(isFavorite: !movie.isFavorite);

    final updatedMovies = state.movies.map((m) {
      return m == movie ? updatedMovie : m;
    }).toIList();

    final updatedFavorites = updatedMovie.isFavorite
        ? state.favoriteMovies.add(updatedMovie)
        : state.favoriteMovies.remove(movie);

    emit(state.copyWith(
      movies: updatedMovies,
      favoriteMovies: updatedFavorites,
    ));
  }

  // Toggle watched status of a movie
  void toggleWatched(Movie movie) {
    final updatedMovie = movie.copyWith(isWatched: !movie.isWatched);

    final updatedMovies = state.movies.map((m) {
      return m == movie ? updatedMovie : m;
    }).toIList();

    final updatedWatched = updatedMovie.isWatched
        ? state.watchedMovies.add(updatedMovie)
        : state.watchedMovies.remove(movie);

    emit(state.copyWith(
      movies: updatedMovies,
      watchedMovies: updatedWatched,
    ));
  }

  // Method to load the next page of movies
  void loadNextPage() {
    if (state.isLoading || !state.hasMore) return;
    fetchMovies(page: state.currentPage + 1);
  }
}
