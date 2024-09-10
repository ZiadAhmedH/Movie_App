import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'movies_controller.dart';
import 'movies_list_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviesController()..fetchMovies(),
      child: const MaterialApp(
        home: MoviesListPage(),
      ),
    );
  }
}