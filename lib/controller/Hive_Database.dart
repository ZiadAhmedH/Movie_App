
import 'package:hive/hive.dart';
import 'package:movies_app/controller/Tv_Series_Details/Data/local/series_adapter.dart';
import 'package:path_provider/path_provider.dart';

import 'Movie_Details_Cubit/Data/Local/movie_adapter.dart';

class HiveDatabase {
  static Future<void> initHive() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(HiveSeriesAdapter());
    Hive.registerAdapter(HiveMovieAdapter());
  }

  static Future<Box<T>> openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  static Future<void> closeHive() async {
    await Hive.close();
  }
}