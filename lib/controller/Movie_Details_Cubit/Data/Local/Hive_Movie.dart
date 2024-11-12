
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'movie_adapter.dart';

class HiveDatabase {
  static Future<void> initHive() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

     Hive.registerAdapter(MovieAdapter());
  }

  static Future<Box<T>> openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  static Future<void> closeHive() async {
    await Hive.close();
  }
}