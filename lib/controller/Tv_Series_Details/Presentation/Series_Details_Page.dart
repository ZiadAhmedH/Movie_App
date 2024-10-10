import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
import 'package:movies_app/controller/Tv_Series_Details/Cubit/series_detials_cubit.dart';
import '../../../model/Components/Custom_Text.dart';
import '../../../view/Movie_Video_Page/Movie_Video.dart';
import '../../Constant/ApiEndPoints.dart';
import '../Cubit/series_detials_state.dart';

class SeriesDetailsScreen extends StatelessWidget {
  final int seriesId;
  const SeriesDetailsScreen({super.key, required this.seriesId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetialsCubit, SeriesDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
          extendBodyBehindAppBar: true,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent, // Make status bar transparent
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                          '${ApiEndPoints.MOVIE_Base_Poster}${state.seriesDetails.backdropPath}',
                          fit: BoxFit.cover,
                          fadeInCurve: Curves.bounceIn,
                          width: double.infinity,
                          fadeInDuration: const Duration(seconds: 1),
                          fadeOutCurve: Curves.bounceOut,
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
                        // Add gradient overlay for the fading effect
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Color.fromRGBO(44, 43, 43, 1),
                                  Color.fromRGBO(44, 40, 43, 1)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.5, 0.85, 0.9], // Control the fade here
                              ),
                            ),
                          ),
                        ),
                        // Movie title with fading effect
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
                                            text: state.seriesDetails.originalName,
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
                                // Add movie rating
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    RichText(text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: state.seriesDetails.voteAverage.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        // add release date
                                        TextSpan(
                                          text: '  (${state.seriesDetails.firstAirDate?.substring(0, 4)})',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Movie details

                  // add movie overview
                  SizedBox(
                    child: state.seriesDetails.overview != null
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
                            text:" ${state.seriesDetails.overview}",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                        : const SizedBox.shrink(),
                  ),

                  //  add Movie trailer button

                  Row(
                    children: [
                      // add button to bavigate to the movie trailer
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => YouTubeVideoPlayer(videoName: "${state.seriesDetails.originalName}")));
                        },
                        child:  FaIcon(FontAwesomeIcons.youtube , color: Colors.red, size: 30,),
                      ),
                    ],
                  )

                  // related movies
                  // sooooon





                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
