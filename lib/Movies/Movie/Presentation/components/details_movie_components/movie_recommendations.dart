import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../../Core/Constents/EndPoints.dart';
import '../../../../../Core/Constents/enums.dart';
import '../../controller/movie_detail_bloc/movie_details_bloc.dart';
import '../../screens/movie_detail_screen.dart';

class MovieRecommendations extends StatelessWidget {
  final MovieDetailsState state;
  const MovieRecommendations({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.recommendationsState) {
      case RequestState.loading:
        return const SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );

      case RequestState.error:
        return const SliverToBoxAdapter(
          child: Center(
            child: Text(
              "Failed to load recommendations",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );

      case RequestState.loaded:
        if (state.recommendations.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: SizedBox()
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final recommendation = state.recommendations[index];
                return FadeInUp(
                  duration: const Duration(milliseconds: 500),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(id: recommendation.id),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: CachedNetworkImage(
                        imageUrl: ApiMovie.imageUr(recommendation.posterPath ?? ''),
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
              childCount: state.recommendations.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 2 / 3,
            ),
          ),
        );
      case RequestState.idle:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
