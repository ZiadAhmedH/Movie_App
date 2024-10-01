import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
import 'package:movies_app/model/models/Movie_test.dart';
import 'package:movies_app/view/Details_Movie_Page/Movie_Details_Page.dart';
import '../../controller/Movie/Repo/Movies_Repo.dart';
import '../../controller/Movie_Details_Cubit/cubit/detials_movie_state.dart';
import '../../controller/ThreeDMovies/Repo/Movies_ThreeD_Repo.dart';
import '../models/Movie_Model.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesDetailsCubit(),
      child: BlocBuilder<MoviesDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MovieDetailsPage(movieId: movie), // Assuming movie.id is available
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CachedNetworkImage(
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
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: const Icon(Icons.sms_failed_outlined, color: Colors.white),
                  );
                },
                placeholder: (context, url) {
                  return Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white54,
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
