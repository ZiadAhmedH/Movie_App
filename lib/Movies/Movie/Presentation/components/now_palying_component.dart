import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movies_state.dart';
import '../../../../Core/Constents/EndPoints.dart';
import '../../../../Core/Constents/enums.dart';
import '../../domain/entities/Movie.dart';
import '../controller/movies_bloc.dart';
import '../screens/movie_detail_screen.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) => previous.nowPlayingMoviesState != current.nowPlayingMoviesState,
      builder: (context, state) {
        switch (state.nowPlayingMoviesState) {
          case RequestState.loading:
            return const SizedBox(
                height: 400.0,
                child:  Center(child: CircularProgressIndicator()));

          case RequestState.error:
            return  SizedBox(
              height: 400.0,
              child: Center(
                child: Text(state.nowPlayingMessage),
              ),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.playingNowMovies.map((item) {
                  return GestureDetector(
                    key: const Key('openMovieMinimalDetail'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return MovieDetailScreen(id: item.id!);
                      },));
                    },
                    child: Stack(
                      children: [
                        ShaderMask(
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
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: 560.0,
                            imageUrl: item.backdropPath != null
                                ? ApiConstants.imageUr(item.backdropPath!)
                                : 'https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fopps&psig=AOvVaw1s8TKGKHuJ87K2KyT86Zhu&ust=1741979373217000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPiY97zhh4wDFQAAAAAdAAAAABAE', // Placeholder image
                            fadeOutCurve: Curves.easeIn,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>const Center(child:  Icon(Icons.error)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.circle, color: Colors.redAccent, size: 16.0),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Now Playing'.toUpperCase(),
                                      style: const TextStyle(fontSize: 16.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  item.title ?? 'Unknown Title',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 24, color: Colors.white),
                                ),
                              ),
                              Text(
                                (item.genreIds?.isNotEmpty ?? false)
                                    ? item.genreIds!.map((e) {
                                  return genres.firstWhere(
                                        (element) => element['id'] == e,
                                    orElse: () => {'name': 'Unknown'},
                                  )['name'];
                                }).join('. ')
                                    : 'Unknown Genre',
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
        }
      },
    );
  }
}
