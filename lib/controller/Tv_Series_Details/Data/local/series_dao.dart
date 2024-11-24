import '../../../Movie_Details_Cubit/Data/Local/Hive_Movie_Database.dart';
import 'Hive_Series_Database.dart';
import 'series_adapter.dart';

class SeriesDao {
  final String _favoritesBoxName = 'favoritesSeriesBox';

  Future<void> addToFavorites(HiveSeries series) async {
    final box = await HiveSeriesDatabase.openBox<HiveSeries>(_favoritesBoxName);
    if (await isFavorite(series.id)) {
      await box.delete(series.id);
      print("${box.values.length} HiveSeries");
      return;
    }

    await box.put(series.id, series);
    print("${box.values.length} HiveSeries");
  }

  Future<void> removeFromFavorites(int seriesId) async {
    final box = await HiveSeriesDatabase.openBox<HiveSeries>(_favoritesBoxName);
    await box.delete(seriesId);
  }

  Future<List<HiveSeries>> getFavoriteSeries() async {
    final box = await HiveSeriesDatabase.openBox<HiveSeries>(_favoritesBoxName);
    return box.values.toList();
  }

  Future<bool> isFavorite(int seriesId) async {
    final box = await HiveSeriesDatabase.openBox<HiveSeries>(_favoritesBoxName);
    return box.containsKey(seriesId);
  }
}
