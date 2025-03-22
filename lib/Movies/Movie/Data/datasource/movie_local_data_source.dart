import 'package:hive/hive.dart';
import '../Models/fav_movie_model.dart';

abstract class MovieLocalDataSource {
  Future<void> saveFavoriteMovie(FavoriteMovieModel movie);
  Future<void> removeFavoriteMovie(int movieId);
  Future<List<FavoriteMovieModel>> getFavoriteMovies();
  Future<bool> isMovieFavorite(int movieId);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  static const String boxName = 'favorite_movies';

  @override
  Future<void> saveFavoriteMovie(FavoriteMovieModel movie) async {
    final box = await Hive.openBox<FavoriteMovieModel>(boxName);
    await box.put(movie.id, movie);
  }

  @override
  Future<void> removeFavoriteMovie(int movieId) async {
    final box = await Hive.openBox<FavoriteMovieModel>(boxName);
    await box.delete(movieId);
  }

  @override
  Future<List<FavoriteMovieModel>> getFavoriteMovies() async {
    final box = await Hive.openBox<FavoriteMovieModel>(boxName);
    return box.values.toList();
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final box = await Hive.openBox<FavoriteMovieModel>(boxName);
    return box.containsKey(movieId);
  }
}
