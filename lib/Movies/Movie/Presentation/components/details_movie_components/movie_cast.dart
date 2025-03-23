import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/Constents/EndPoints.dart';
import '../../../../../Core/Constents/enums.dart';
import '../../controller/movie_detail_bloc/movie_details_bloc.dart';

class MovieCastList extends StatelessWidget {
  final MovieDetailsState state;
  const MovieCastList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.castState) {
      case RequestState.loading:
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 120, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => _loadingPlaceholder(),
            ),
          ),
        );

      case RequestState.error:
        return SliverToBoxAdapter(
          child: Center(
            child: Text(state.castMessage),
          ),
        );

      case RequestState.loaded:
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 120, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.cast.length,
              itemBuilder: (context, index) {
                final cast = state.cast[index];
                return FadeInUp(
                  from: 50,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 55.0,
                      backgroundColor: Colors.grey[800],
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[800],
                        backgroundImage: cast.profilePath != null && cast.profilePath!.isNotEmpty
                            ? CachedNetworkImageProvider(ApiMovie.imageUr(cast.profilePath!))
                            : null,
                        child: cast.profilePath == null || cast.profilePath!.isEmpty
                            ? const Icon(Icons.error, size: 40)
                            : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
    }
  }

  Widget _loadingPlaceholder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child:_shimmerPlaceholder() ,
    );
  }
}

Widget _shimmerPlaceholder() {
  return Shimmer.fromColors(
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
  );
}