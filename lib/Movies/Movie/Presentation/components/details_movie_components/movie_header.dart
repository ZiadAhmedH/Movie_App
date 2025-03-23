import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../Core/Constents/EndPoints.dart';
import '../../../domain/entities/movie_details.dart';


class MovieHeader extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieHeader({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      backgroundColor: Colors.black,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double currentHeight = constraints.biggest.height;
          bool isCollapsed = currentHeight < 150;
          return FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
            centerTitle: true,
            title: isCollapsed
                ? Text(
              movieDetails.title ?? " ",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )
                : null, // Hide title when expanded
            background: CachedNetworkImage(
              imageUrl: ApiMovie.imageUr(movieDetails.backdropPath ?? ''),
              fit: BoxFit.cover,
              placeholder: (context, url) => _shimmerPlaceholder(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        },
      ),
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
