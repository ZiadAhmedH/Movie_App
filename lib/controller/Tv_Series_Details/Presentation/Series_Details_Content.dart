
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../model/Components/Custom_Text.dart';
import '../../../view/Movie_Video_Page/Movie_Video.dart';
import '../../Constant/ApiEndPoints.dart';
import '../Cubit/series_detials_state.dart';

Widget buildSeriesDetails(BuildContext context, SeriesDetailsState state) {
  return Column(
    children: [
      // Series image and title with gradient effect
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
              '${ApiEndPoints.MOVIE_Base_Poster}${state.seriesDetails.backdropPath}',
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, url) => Row(
                children: [
                  Center(
                    child: LoadingAnimationWidget.discreteCircle(
                        color: Colors.white12, size: 100),
                  ),
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
                      Color.fromRGBO(44, 43, 43, 1),
                      Color.fromRGBO(44, 40, 43, 1)
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
                                text: state.seriesDetails.voteAverage
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                '  (${state.seriesDetails.firstAirDate?.substring(0, 4)})',
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

      // Series overview section
      state.seriesDetails.overview != null
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
              text: " ${state.seriesDetails.overview}",
              fontSize: 16,
              color: Colors.white,
            ),
          ],
        ),
      )
          : const SizedBox.shrink(),

      // Series trailer button (YouTube player)
      Row(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YouTubeVideoPlayer(
                    videoName: "${state.seriesDetails.originalName}",
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