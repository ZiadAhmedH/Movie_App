import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Repos/Movies_ThreeD_Repo.dart';
import 'package:movies_app/view/Main_Page/3d_Movies_Section/LoadMore_Section.dart';

import '../../../controller/Repos/Movies_Repo.dart';
import '../../../controller/Shared_Cubit/favorites_and_watched_cubit.dart';
import '../../../controller/ThreeDCubit/three_dcubit_cubit.dart';
import '../../../controller/ThreeDCubit/three_dcubit_state.dart';
import '../../../model/Components/Custom_Text.dart';
import '../../../model/models/Movie_Model.dart';
import '../../../model/widgets/Movie_List_Widget.dart';
import '../Movie_Section/movies_list_page.dart';
class ThreeDMoviesSection extends StatelessWidget {
  const ThreeDMoviesSection({super.key});

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
        rating: 0.0,
        runtime: 0,
        isFavorite: false,
        isWatched: false,
      ),
    );
    return  Column(
      children: [
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
  create: (context) => ThreeDcubitCubit(context.read<ThreeDMovieRepository>(),context.read<FavoritesAndWatchedCubit>())..fetchSample3DMovies(),
  child: BlocBuilder<ThreeDcubitCubit, ThreeDState>(
                      builder: (context, state) {
                        return LoadMoviesScreen();
                      },
                    ),
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
        BlocBuilder<ThreeDcubitCubit, ThreeDState>(
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
