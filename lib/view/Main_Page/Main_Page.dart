import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../controller/Movie/Presentation/MovieSection/Movie_Section.dart';
import '../../controller/Movie/cubit/Movie_Cubit.dart';
import '../../controller/Movie/cubit/Movie_State.dart';
import '../../controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
import '../../model/Components/Custom_Text.dart';
import '../../controller/Movie/Data/Models/Movie_Model.dart';
import '../../controller/Movie/Presentation/Widgets/Movie_List_Widget.dart';
import '../Details_Movie_Page/ContentPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Providing MoviesDetailsCubit at the top level so all child widgets can access it
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Random Movie Section using MovieCubit
            // BlocBuilder<MovieCubit, MovieState>(
            //   bloc: MovieCubit()..fetchRandomMovie(),
            //   builder: (context, state) {
            //     return RandomSection(randomMovie: state.randomMovie);
            //   },
            // ),
            // Trending Movies Section
         SizedBox(
              height: 100,
            ),
            MovieSectionView(),

          ],
        ),
      ),
    );
  }
}
