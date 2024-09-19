
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/Movie_Details_Cubit/detials_movie_cubit.dart';
import '../../controller/Movie_Details_Cubit/detials_movie_state.dart';
import '../../model/models/Movie_Model.dart';

class MovieDetailsPageContent extends StatelessWidget {
  final MoviesDetailsLoaded moviesDetailsState;
  const MovieDetailsPageContent({
    super.key,
    required this.moviesDetailsState,
  });

  Movie get movie => moviesDetailsState.movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: movie.backgroundImageUrl ,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        ListView(
          padding: MediaQuery.of(context).padding +
              const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.yellow, width: 5),
                    color: Colors.red,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl: movie.imageUrl ,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Year: ${movie.year}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Rating: ${movie.rating}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Runtime: ${movie.runtime} minutes',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<MoviesDetailsCubit>().toggleWatched(movie.id);
                  },
                  icon: Icon(
                    moviesDetailsState.isWatched
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: moviesDetailsState.isWatched ? Colors.green : null,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<MoviesDetailsCubit>().toggleFavorite(movie.id);
                  },
                  icon: Icon(
                    moviesDetailsState.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: moviesDetailsState.isFavorite ? Colors.red : null,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}