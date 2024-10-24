import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
import '../../../model/Components/Custom_Text.dart';
import '../../../view/Movie_Video_Page/Movie_Video.dart';
import '../../Constant/ApiEndPoints.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../cubit/detials_movie_state.dart';
import 'Details_Movie_Content_Loaded.dart';
import 'ShimmerDetailsMovie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, DetailsMovieState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
          extendBodyBehindAppBar: true,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Show shimmer if loading state
                  state is DetailsMovieStateLoading
                      ? buildShimmerLoader(context)
                      : buildMovieDetails(context, state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
