import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/controller/Tv_Series_Details/Cubit/series_detials_cubit.dart';
import '../../../Core/Components/Custom_Text.dart';
import '../../../view/Movie_Video_Page/Movie_Video.dart';
import '../../Constant/ApiEndPoints.dart';
import '../Cubit/series_detials_state.dart';

Widget buildSeriesDetails(
    BuildContext context,
    SeriesDetailsState state,
    void Function() onToggleFavorite,
    ) {
  return Column(
    children: [
      _buildSeriesBackdropImage(context, state),
      _buildSeriesInfo(context, state, onToggleFavorite),
      _buildSeriesOverviewSection(state),
      _buildSeriesTrailerButton(context, state),
    ],
  );
}

// Backdrop Image with Gradient Overlay
Widget _buildSeriesBackdropImage(BuildContext context, SeriesDetailsState state) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.3,
    child: Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
          '${ApiEndPoints.MOVIE_Base_Poster}${state.seriesDetails?.backdropPath ?? ""}',
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: (context, url) => Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white12,
              size: 100,
            ),
          ),
          errorWidget: (context, url, error) =>
          const FaIcon(FontAwesomeIcons.image),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromRGBO(44, 43, 40, 1),
                  Color.fromRGBO(44, 40, 50, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.85, 0.9],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// Series Title, Rating, and Favorite Icon
Widget _buildSeriesInfo(
    BuildContext context,
    SeriesDetailsState state,
    void Function() onToggleFavorite,
    ) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                state.seriesDetails.originalName ?? "Unknown Title",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<SeriesDetailsCubit, SeriesDetailsState>(
              builder: (context, state) {
                if (state is DetailsSeriesStateLoading) {
                  return const CircularProgressIndicator(color: Colors.orange); // Show a default icon while loading
                } else if (state is DetailsSeriesStateLoaded) {
                  return IconButton(
                    icon: Icon(
                        state.isFav ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      onToggleFavorite();
                    },
                  );
                } else {
                  return const Icon(Icons.error);
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.yellow, size: 20),
            Text(
              '${state.seriesDetails?.voteAverage?.toStringAsFixed(1) ?? "N/A"} '
                  '(${state.seriesDetails?.firstAirDate?.substring(0, 4) ?? "N/A"})',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// Overview Section
Widget _buildSeriesOverviewSection(SeriesDetailsState state) {
  return state.seriesDetails?.overview != null
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
          text: state.seriesDetails!.overview!,
          fontSize: 16,
          color: Colors.white,
        ),
      ],
    ),
  )
      : const SizedBox.shrink();
}

// Trailer Button
Widget _buildSeriesTrailerButton(BuildContext context, SeriesDetailsState state) {
  return Row(
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
  );
}
