

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/movies_controller.dart';
import '../models/Movie_Model.dart';

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
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAlias,
                );
              },
              errorWidget: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 150,
                  child: const Icon(Icons.error, color: Colors.white),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.antiAlias,

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
          Expanded(child: Text(movie.title , style: TextStyle(color: Colors.white),)),
          IconButton(
            onPressed: () {
              context.read<MovieCubit>().toggleFavorite(movie);
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