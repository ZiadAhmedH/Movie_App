import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/Components/Custom_Text.dart';
import '../../../../../Core/Constents/EndPoints.dart';
import '../../../../../Core/Constents/enums.dart';
import '../../controller/fav_bloc_movie/fav_movie_bloc.dart';
import '../../controller/fav_bloc_movie/fav_movie_state.dart';
import '../../screens/movie_detail_screen.dart';

class MylistComponent extends StatelessWidget {
  const MylistComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FavMovieBloc, FavMovieState>(
        builder: (context, state) {
          switch(state.favMoviesState){
            case RequestState.idle:
              return const SizedBox();


            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());

            case RequestState.loaded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),

                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.favoriteMovies.length,
                    itemBuilder: (context, index) {
                      print(state.favoriteMovies.length );
                      final movie = state.favoriteMovies[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MovieDetailScreen(id: movie.id!);
                            },));
                          },
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl: ApiMovie.imageUr(movie.posterPath ?? ""),
                              placeholder: (context, url) =>
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error,
                                  color: Colors.white), // White error icon
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );

           case RequestState.error:
             return const Center(child: Text('Error'));
          }


        },
    );
  }
}
