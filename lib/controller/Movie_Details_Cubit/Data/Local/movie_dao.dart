import 'Hive_Movie.dart';
import 'movie_adapter.dart';
class MovieDao {
  final String _favoritesBoxName = 'favoritesBox';

  Future<void> addToFavorites(HiveMovie movie) async {
    final box = await HiveDatabase.openBox<HiveMovie>(_favoritesBoxName);
    await box.put(movie.id, movie); // Use movie ID as the key
  }

  Future<void> removeFromFavorites(int movieId) async {
    final box = await HiveDatabase.openBox<HiveMovie>(_favoritesBoxName);
    await box.delete(movieId); // Remove by movie ID
  }

  Future<List<HiveMovie>> getFavoriteMovies() async {
    final box = await HiveDatabase.openBox<HiveMovie>(_favoritesBoxName);
    return box.values.toList();
  }

  Future<bool> isFavorite(int movieId) async {
    final box = await HiveDatabase.openBox<HiveMovie>(_favoritesBoxName);
    return box.containsKey(movieId);
  }
}
