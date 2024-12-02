import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../controller/Constant/ApiEndPoints.dart';
import '../../../Movie_Details_Cubit/Presentation/Movie_Details_Page.dart';
import '../../../Movie_Details_Cubit/cubit/Details_Cubit/detials_movie_cubit.dart';
import '../../Data/Models/Movie_Model.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;


  const MovieWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => MoviesDetailsCubit()..getMovieDetails(movie.id),
                  child: MovieDetailsScreen(movie: movie),
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CachedNetworkImage(
          imageUrl: '${ApiEndPoints.MOVIE_Base_Poster}${movie.posterPath}',
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
              child: const Icon(
                  Icons.sms_failed_outlined, color: Colors.white),
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
  }
}
