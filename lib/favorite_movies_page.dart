import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movies_controller.dart';
import 'movies_list_page.dart';
class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MoviesController>();

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: controller.favoriteMovies.length,
              itemBuilder: (context, index) {
                return  MovieWidget(movie:controller.favoriteMovies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
