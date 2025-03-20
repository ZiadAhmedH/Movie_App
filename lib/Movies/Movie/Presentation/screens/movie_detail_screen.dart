import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Core/Constents/EndPoints.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movie_details_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import '../../../../Core/Components/Custom_Text.dart';
import '../../../../Core/Constents/app_string.dart';
import '../../../../Core/Constents/enums.dart';
import '../../../../dependancy_Injection/service_DI.dart';
import '../../domain/entities/generes.dart';
import '../../domain/entities/movie_details.dart';
class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print('MovieDetailScreen: $id');
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(FetchMovieDetailsEvent(id))
        ..add(FetchMovieRecommendationsEvent(id))
        ..add(FetchMovieCastEvent(id)),
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return  Center(child:Lottie.asset('assets/lotties/loading.json',width: 200,height: 200));

          case RequestState.error:
            return Center(child: Text(state.movieDetailsMessage));

          case RequestState.loaded:
            if (state.movieDetails == null) {
              return const Center(child: Text("Movie details not available"));
            }

            final movieDetails = state.movieDetails!;

            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstants.imageUr(movieDetails.backdropPath ?? ''),
                          fit: BoxFit.cover,
                          placeholder: (context, url) => _shimmerPlaceholder(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
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
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          _buildMovieInfo(movieDetails),
                          const SizedBox(height: 20.0),
                          Text(
                            movieDetails.overview ?? "No description available",
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Genres: ${_showGenres(movieDetails.genres)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                SliverPadding(padding:const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: _showCast(state),),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Text(
                        AppString.recommendations,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: _showRecommendations(state),
                ),
              ],
            );
        }
      },
    );
  }

  Widget _buildMovieInfo(MovieDetails movieDetails) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            movieDetails.releaseDate?.split('-')[0] ?? "Unknown Year",
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20.0,
            ),
            const SizedBox(width: 4.0),
            Text(
              (movieDetails.voteAverage ?? 0 / 2).toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Text(
          _showDuration(movieDetails.runtime ?? 0),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  String _showGenres(List<Genres>? genres) {
    if (genres == null || genres.isEmpty) return "N/A";
    return genres.map((genre) => genre.name).join(", ");
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;
    return hours > 0 ? '${hours}h ${minutes}m' : '${minutes}m';
  }

  Widget _showRecommendations(MovieDetailsState state) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          if (state.recommendations.isEmpty) {
            return  const Center(child: CustomText(text: "No Recommended Movies",color: Colors.white));
          }
          final recommendation = state.recommendations[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MovieDetailScreen(id: recommendation.id);
              }));
            },
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.imageUr(recommendation.posterPath ?? ''),
                  placeholder: (context, url) => _shimmerPlaceholder(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        childCount: state.recommendations.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }


  Widget _showCast(MovieDetailsState state) {
    switch (state.castState) {
      case RequestState.loading:
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 120, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _shimmerPlaceholder(),
              ),
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
                            ? CachedNetworkImageProvider(ApiConstants.imageUr(cast.profilePath!))
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
}
