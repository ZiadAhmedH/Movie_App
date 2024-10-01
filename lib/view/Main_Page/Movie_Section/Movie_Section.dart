import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/Movie/Repo/Movies_Repo.dart';
import '../../../controller/Movie/cubit/Movie_Cubit.dart';
import '../../../controller/Movie/cubit/Movie_State.dart';
import '../../../model/Components/Custom_Text.dart';
import '../../../model/models/Movie_Model.dart';
import '../../../model/widgets/Movie_List_Widget.dart';
import 'movies_list_page.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Movie> fakeMovies = List.generate(
      8,
      (index) => Movie(
        id: index,
        title: 'Loading...',
        imageUrl: "https://via.placeholder.com/150",
        backgroundImageUrl: "https://via.placeholder.com/150",
        year: 0,
        genres: [],
        rating: 0.0,
        runtime: 0,
        isFavorite: false,
        isWatched: false,
      ),
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(
              text: 'Movies Trending Today',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider(
                        create: (context) =>
                            MovieCubit()
                              ..fetchMovies(),
                        child: BlocBuilder<MovieCubit, MovieState>(
                          builder: (context, state) {
                            return MoviesScreen(
                              fetchMoreMovies: () =>
                                  context.read<MovieCubit>().fetchMoreMovies(),
                              movieState: context
                                  .watch<MovieCubit>()
                                  .state, // Ensure you're watching the right state
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
              child: CustomText(
                text: 'See All',
                fontSize: 18,
                color: Colors.amber[700],
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                children: [
                  Expanded(
                    child: state.movies.isEmpty
                        ? ListView.builder(
                            itemCount: fakeMovies.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              // Use fake movie data while loading
                              return MovieWidget(
                                movie: fakeMovies[index],
                              );
                            },
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.movies.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return MovieWidget(
                                movie: state.movies[index],
                              );
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
