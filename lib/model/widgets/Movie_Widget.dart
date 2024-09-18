import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/3DMovies_Cubit/three_d_movies_details_cubit.dart';

import '../../controller/Movie_Details_Cubit/detials_movie_cubit.dart';
import '../../controller/Movie_Details_Cubit/detials_movie_state.dart';
import '../../controller/Movies_Repo.dart';
import '../../view/Movie_Details_Page.dart';
import '../models/Movie_Model.dart';

class Movie3DWidget extends StatelessWidget {
  final Movie movie;

  const Movie3DWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThreeDMoviesDetailsCubit(movie.id, context.read<MoviesRepo>()),
      child: BlocBuilder<ThreeDMoviesDetailsCubit, ThreeDMoviesDetailsState>(
        builder: (context, state) {
          return GestureDetector(

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
                          child: const Icon(Icons.sms_failed_outlined, color: Colors.white),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}