import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/Constant/ApiEndPoint.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';

import '../../../model/Components/Custom_Text.dart';
import '../cubit/detials_movie_state.dart';
class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MoviesDetailsCubit, DetailsMovieState>(
    builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.black,
         body:  Stack(
        children: [
          CachedNetworkImage(
            imageUrl: '${ApiEndPoints.MOVIE_Base_Poster}${state.movieDetails.backdropPath}'?? '' ,
            fit: BoxFit.cover,
            placeholder: (context, url) =>  Center(
              child: LoadingAnimationWidget.discreteCircle(color: Colors.white12, size: 100),
            ),
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
                      color: Colors.grey,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                      imageUrl: '${ApiEndPoints.MOVIE_Base_Poster}${state.movieDetails.posterPath}' ?? '' ,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.movieDetails.title ?? 'unknown',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Year: ${state.movieDetails.releaseDate} ',
                        style: const TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rating: ${state.movieDetails.popularity}',
                        style: const TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Runtime: ${state.movieDetails.runtime} minutes',
                        style: const TextStyle(color: Colors.white ,  fontSize: 18 , fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),



              const SizedBox(height: 10),



            ],
          ),
        ],
      ),
      );
    },
    );
  }
}
