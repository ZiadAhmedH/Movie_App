import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/Components/Custom_Text.dart';
import '../../cubit/Movie_Cubit.dart';
import '../../cubit/Movie_State.dart';
import '../Widgets/Movie_List_Widget.dart';
import 'AllMovieList.dart';

class MovieSectionView extends StatelessWidget {
  const MovieSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit()..fetchPopularMovies(),
      child: Column(
        children: [
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Movies Trending Today',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
   Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(
  create: (context) => MovieCubit()..fetchPopularMovies(),
  child: ViewAllMovies(),
)));
                  },
                  child: CustomText(
                    text: 'View All',
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ]),

          // Movie List Section
          BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieLoaded) {
                return SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.2,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.movies
                              .length, // Ensure movies list isn't null
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // Make sure the MovieWidget has access to the cubit
                            return MovieWidget(
                              movie: state.movies[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
