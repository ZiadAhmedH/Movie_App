import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Movies/Movie/Presentation/screens/movies_screen.dart';
import 'dependancy_Injection/service_DI.dart';
import 'Movies/Movie/Data/Models/fav_movie_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive Adapter for FavoriteMovieModel
  Hive.registerAdapter(FavoriteMovieModelAdapter());

  // Open the Hive Box for storing favorite movies
  await Hive.openBox<FavoriteMovieModel>('favorite_movies');

  // Initialize Dependency Injection
  ServiceLocator().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: MoviesScreen(),
    );
  }
}
