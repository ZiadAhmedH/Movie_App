import 'Hive_Movie_Database.dart';
import 'movie_adapter.dart';
class MovieDao {
  final String _favoritesBoxName = 'favoritesBox';

  Future<void> addToFavorites(HiveMovie movie) async {
    final box = await HiveMovieDatabase.openBox<HiveMovie>(_favoritesBoxName);
    if (await isFavorite(movie.id)) {
      await box.delete(movie.id);
      print("${box.values.length} HiveMovie");

      return;
    }

    await box.put(movie.id, movie);

    print("${box.values.length} HiveMovie");

  }

  Future<void> removeFromFavorites(int movieId) async {
    final box = await HiveMovieDatabase.openBox<HiveMovie>(_favoritesBoxName);
    await box.delete(movieId);
  }

  Future<List<HiveMovie>> getFavoriteMovies() async {
    final box = await HiveMovieDatabase.openBox<HiveMovie>(_favoritesBoxName);
    return box.values.toList();
  }

  Future<bool> isFavorite(int movieId) async {
    final box = await HiveMovieDatabase.openBox<HiveMovie>(_favoritesBoxName);
    return box.containsKey(movieId);
  }
}
