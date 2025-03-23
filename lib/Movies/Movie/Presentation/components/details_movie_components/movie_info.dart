import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain/entities/generes.dart';
import '../../../domain/entities/movie_details.dart';

class MovieInfoSection extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieInfoSection({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInUp(
        duration: const Duration(milliseconds: 600),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieDetails.title ?? "Unknown Title",
                style: GoogleFonts.poppins(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2),
              ),
              const SizedBox(height: 8.0),
              // Rating
              Row(
                children: [
                  Text(
                    movieDetails.releaseDate?.split('-')[0] ?? "Unknown Year",
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 16.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20.0),
                      const SizedBox(width: 4.0),
                      Text(
                        (movieDetails.voteAverage ?? 0).toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  Text(
                    '${(movieDetails.runtime)! ~/ 60 ?? 0} hr ${(movieDetails.runtime)! % 60 ?? 0} min',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),

                  // Language
                ],
              ),
              Text(
                movieDetails.overview ?? "No description available",
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Genres: ${_showGenres(movieDetails.genres)}',
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _showGenres(List<Genres>? genres) {
    if (genres == null || genres.isEmpty) return "N/A";
    return genres.map((genre) => genre.name).join(", ");
  }
}
