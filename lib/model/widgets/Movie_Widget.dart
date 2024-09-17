import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/Movie_Details_Cubit/detials_movie_cubit.dart';
import '../../controller/Movie_Details_Cubit/detials_movie_state.dart';
import '../../controller/Movies_Repo.dart';
import '../../view/Movie_Details_Page.dart';
import '../models/Movie_Model.dart';
class MovieWidget extends StatelessWidget {
  final Movie movie;
  const MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsPage(movieId: movie.id),
          ),
        );
      },
      child: Padding(
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
            ),
            const SizedBox(width: 10),
            Expanded(child: Text(movie.title)),
            BlocProvider(
              create: (context) => MoviesDetailsCubit(
                movie.id,
                context.read<MoviesRepo>(),
              ),
              child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
                builder: (context, state) {
                  switch (state) {
                    case MoviesDetailsLoading():
                      return const CircularProgressIndicator();
                    case MoviesDetailsError():
                      return const Icon(Icons.error, color: Colors.red);
                    case MoviesDetailsLoaded():
                      return Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<MoviesDetailsCubit>()
                                  .toggleWatched(movie.id);
                            },
                            icon: Icon(
                              state.isWatched
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: state.isWatched ? Colors.green : null,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<MoviesDetailsCubit>()
                                  .toggleFavorite(movie.id);
                            },
                            icon: Icon(
                              state.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: state.isFavorite ? Colors.red : null,
                            ),
                          ),
                        ],
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}