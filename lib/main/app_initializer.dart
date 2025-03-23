import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../dependancy_Injection/service_DI.dart';
import '../Movies/Movie/Data/Models/fav_movie_model.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteMovieModelAdapter());
  await Hive.openBox<FavoriteMovieModel>('favorite_movies');

  ServiceLocator().init();
}
