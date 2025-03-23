import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Core/Constents/EndPoints.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movie_detail_bloc/movie_details_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import '../../../../Core/Components/Custom_Text.dart';
import '../../../../Core/Constents/app_string.dart';
import '../../../../Core/Constents/enums.dart';
import '../../../../dependancy_Injection/service_DI.dart';
import '../../Data/Models/fav_movie_model.dart';
import '../../domain/entities/generes.dart';
import '../../domain/entities/movie_details.dart';
import '../controller/fav_bloc_movie/fav_movie_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<FavMovieBloc>()..add(CheckIfMovieFavEvent(id)),
        ),
        BlocProvider(
          create: (context) => sl<MovieDetailsBloc>()
            ..add(FetchMovieDetailsEvent(id))
            ..add(FetchMovieRecommendationsEvent(id))
            ..add(FetchMovieCastEvent(id)),
        ),
      ],
      child: Scaffold(
        body: MovieDetailContent(id: id),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  final int id;
  const MovieDetailContent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return Center(
              child: Lottie.asset('assets/lotties/loading.json', width: 200, height: 200),
            );

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
                  backgroundColor: Colors.black,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      // Get the current app bar height
                      double currentHeight = constraints.biggest.height;

                      // Determine if the app bar is collapsed (close to the min height)
                      bool isCollapsed = currentHeight < 150; // Adjust threshold as needed

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
                          imageUrl: ApiConstants.imageUr(movieDetails.backdropPath ?? ''),
                          fit: BoxFit.cover,
                          placeholder: (context, url) => _shimmerPlaceholder(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      );
                    },
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
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.movie_creation_outlined, color: Colors.white, size: 30),
                          const Icon(Icons.share, color: Colors.white, size: 30),
                          _buildFavoriteButton(context, movieDetails),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: _showCast(state),
                ),

                // recommendations
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

  Widget _buildFavoriteButton(BuildContext context, MovieDetails movieDetails) {
    return BlocBuilder<FavMovieBloc, FavMovieState>(
      builder: (context, state) {
        bool isFavorite = state is FavMovieAdded && state.favoriteMovieModel.id == movieDetails.id;

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.white,
            size: 30,
          ),
          onPressed: () {
            final favoriteMovie = FavoriteMovieModel(
              id: movieDetails.id!,
              title: movieDetails.title!,
              posterPath: movieDetails.posterPath!,
            );

            if (isFavorite) {
              context.read<FavMovieBloc>().add(RemoveFavMovieEvent(favoriteMovie.id));
            } else {
              context.read<FavMovieBloc>().add(AddFavMovieEvent(favoriteMovie));
            }

            context.read<FavMovieBloc>().add(CheckIfMovieFavEvent(movieDetails.id!));
          },
        );
      },
    );
  }

  Widget _buildMovieInfo(MovieDetails movieDetails) {
    return Row(
      children: [
        Text(
          movieDetails.releaseDate?.split('-')[0] ?? "Unknown Year",
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 16.0),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20.0),
            const SizedBox(width: 4.0),
            Text(
              (movieDetails.voteAverage ?? 0).toStringAsFixed(1),
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  String _showGenres(List<Genres>? genres) {
    if (genres == null || genres.isEmpty) return "N/A";
    return genres.map((genre) => genre.name).join(", ");
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


}
