import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../controller/Constant/ApiEndPoints.dart';
import '../../controller/Movie/cubit/Movie_Cubit.dart';
import '../../controller/Movie/cubit/Movie_State.dart';
import '../../controller/Movie_Details_Cubit/Presentation/Movie_Details_Page.dart';
import '../../controller/Movie_Details_Cubit/cubit/Details_Cubit/detials_movie_cubit.dart';
class RandomMovieSection extends StatelessWidget {
  const RandomMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: LoadingAnimationWidget.discreteCircle(
                  color: Colors.deepOrange, size: 50),
            ),
          );
        } else if (state is MovieLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    repeat: ImageRepeat.noRepeat,
                    imageUrl: "${ApiEndPoints.MOVIE_Base_Poster}${state.randomMovie.posterPath}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${state.randomMovie.title}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context) {
                            return BlocProvider(
                              create: (context) => MoviesDetailsCubit()..getMovieDetails(state.randomMovie.id),
                              child: MovieDetailsScreen(movie: state.randomMovie,),
                            );
                          }, ));

                        }, icon: const Icon(Icons.info_outline, color: Colors.white,),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        else if (state is MovieError) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: const Center(
              child: Text('Error'),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
