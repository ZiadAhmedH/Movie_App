import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite_movies_page.dart';
import 'movies_controller.dart';

class MoviesListPage extends StatelessWidget {
  const MoviesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MoviesController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: controller.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: controller.movies.length,
        itemBuilder: (context, index) {
          return MovieWidget(movie: controller.movies[index]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FavoriteMoviesPage();
            }));
          }

        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}

class MovieWidget extends StatelessWidget {
  final Movie movie;
  const MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: movie.imageUrl,
            width: 100,
            height: 150,
            errorWidget: (context, error, stackTrace) {
              return Container(
                width: 100,
                height: 150,
                color: Colors.grey,
                child: const Icon(Icons.error, color: Colors.white),
              );
            },
            placeholder: (context, url) {
              return Container(
                width: 100,
                height: 150,
                color: Colors.grey,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          ),
          SizedBox(width: 10),
          Expanded(child: Text(movie.title)),
          IconButton(
            onPressed: () {
              context.read<MoviesController>().toggleFavorite(movie);
            },
            icon: Icon(
              movie.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: movie.isFavorite ? Colors.red : null,
            ),
          ),
        ],
      ),
    );
  }
}