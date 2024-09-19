import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie_Cubit/Movie_State.dart';
import 'package:movies_app/model/Components/Custom_Text.dart';
import 'package:movies_app/model/widgets/Movie_List_Widget.dart';
import 'package:movies_app/view/movies_list_page.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../controller/Movie_Cubit/Movie_Cubit.dart';
import '../controller/Movies_Repo.dart';
import '../model/models/Movie_Model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a fake list of movies
    final List<Movie> fakeMovies = List.generate(
      8,
          (index) => Movie(
        id: index,
        title: 'Loading...',
        imageUrl: '',
        backgroundImageUrl: '',
        year: 0,
        rating: 0.0,
        runtime: 0,
        isFavorite: false,
        isWatched: false,
        is3DMovie: false,
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                      builder: (context) => BlocProvider(
                        create: (context) => MovieCubit(context.read<MoviesRepo>())..fetchMoreMovies(),
                        child:  MoviesScreen(),
                      ),
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
                      child:  state.movies.isEmpty
                          ? Skeletonizer(

                        child: ListView.builder(
                          itemCount: fakeMovies.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // Use fake movie data while loading
                            return MovieWidget(
                              movie: fakeMovies[index],
                            );
                          },
                        ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: '3D Movies & Fantasy',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(width: 10),
              CustomText(
                text: 'See All',
                fontSize: 18,
                color: Colors.amber[700],
                fontWeight: FontWeight.normal,
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
                      child: state.threeDMovies == null || state.threeDMovies.isEmpty
                          ? Skeletonizer(
                        child: ListView.builder(
                          itemCount: fakeMovies.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // Use fake movie data while loading
                            return MovieWidget(
                              movie: fakeMovies[index],
                            );
                          },
                        ),
                      )
                          : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.threeDMovies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MovieWidget(
                            movie: state.threeDMovies[index],
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
      ),
    );
  }
}
