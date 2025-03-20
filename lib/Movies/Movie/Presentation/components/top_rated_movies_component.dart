import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movies_bloc.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Core/Constents/EndPoints.dart';
import '../../../../Core/Constents/enums.dart';
import '../screens/movie_detail_screen.dart';

class TopRatedMoviesComponent extends StatelessWidget {
  const TopRatedMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) => previous.topRatedMoviesState != current.topRatedMoviesState,
      builder: (context, state) {

        switch(state.topRatedMoviesState){

          case RequestState.loading:
            return const SizedBox(
                height: 170.0,
                child: Center(child: CircularProgressIndicator()));

          case RequestState.error:
            return SizedBox(
              height: 170.0,
              child: Center(
                child: Text(state.topRatedMessage),
              ),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovies[index];
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
                            imageUrl: ApiConstants.imageUr(movie.posterPath!),
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


        }

      },
    );
  }
}
