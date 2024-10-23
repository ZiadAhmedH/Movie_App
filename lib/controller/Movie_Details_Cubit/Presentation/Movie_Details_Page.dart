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

  // Shimmer skeleton loader
  Widget buildShimmerLoader(BuildContext context) {
    return Column(
      children: [
        // Movie image shimmer
        Shimmer.fromColors(
          baseColor: Colors.grey[700]!,
          highlightColor: Colors.grey[500]!,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),

        // Shimmer for title and rating
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[700]!,
                highlightColor: Colors.grey[500]!,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 24,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[700]!,
                    highlightColor: Colors.grey[500]!,
                    child: Container(
                      width: 50,
                      height: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[700]!,
                    highlightColor: Colors.grey[500]!,
                    child: Container(
                      width: 40,
                      height: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Shimmer.fromColors(
                baseColor: Colors.grey[700]!,
                highlightColor: Colors.grey[500]!,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Shimmer.fromColors(
                baseColor: Colors.grey[700]!,
                highlightColor: Colors.grey[500]!,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Movie details UI once data is loaded
  Widget buildMovieDetails(BuildContext context, DetailsMovieState state) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:
                '${ApiEndPoints.MOVIE_Base_Poster}${state.movieDetails.backdropPath}',
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.discreteCircle(
                        color: Colors.white12, size: 100),
                  ],
                ),
                errorWidget: (context, url, error) =>
                const FaIcon(FontAwesomeIcons.elementor),
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Color.fromRGBO(44, 43, 40, 1),
                        Color.fromRGBO(44, 40, 50, 1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 0.85, 0.9],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: state.movieDetails.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: state.movieDetails.voteAverage
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  '  (${state.movieDetails.releaseDate?.substring(0, 4)})',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Movie overview section
        state.movieDetails.overview != null
            ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Overview',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              CustomText(
                text: " ${state.movieDetails.overview}",
                fontSize: 16,
                color: Colors.white,
              ),
            ],
          ),
        )
            : const SizedBox.shrink(),

        // Movie trailer button (YouTube player)
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YouTubeVideoPlayer(
                      videoName: "${state.movieDetails.title}",
                    ),
                  ),
                );
              },
              child: const FaIcon(
                FontAwesomeIcons.youtube,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
