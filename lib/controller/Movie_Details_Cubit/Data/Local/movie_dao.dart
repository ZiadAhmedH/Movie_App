import '../../../Movie/Data/Models/Movie_Model.dart';
import 'Hive_Movie.dart';

class MovieDao {
  final String _boxName = 'movieDB';

  Future<void> addMovie(Movie movie) async {
    final box = await HiveDatabase.openBox<Movie>(_boxName);
    await box.put(movie.id, movie);
  }

  Future<Movie?> getMovie(int id) async {
    final box = await HiveDatabase.openBox<Movie>(_boxName);
    return box.get(id);
  }

  Future<List<Movie>> getAllMovies() async {
    final box = await HiveDatabase.openBox<Movie>(_boxName);
    return box.values.toList();
  }

  Future<void> deleteMovie(int id) async {
    final box = await HiveDatabase.openBox<Movie>(_boxName);
    await box.delete(id);
  }

}
