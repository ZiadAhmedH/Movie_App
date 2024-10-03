import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
import '../../controller/Movie_Details_Cubit/cubit/detials_movie_state.dart';
import '../../model/widgets/Movie_List_Widget.dart';
class ListMoviePage extends StatelessWidget {
  const ListMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 43, 43, 1),

      body: BlocBuilder<MoviesDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          // Check if the state is MoviesDetailsLoaded before accessing the favoriteList
          if (state is MoviesDetailsLoaded && state.favoriteList.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.favoriteList.length,
                    itemBuilder: (context, index) {
                      return MovieWidget(movie: state.favoriteList[index]);
                    },
                  ),
                ),
              ],
            );
          } else if (state is MoviesDetailsLoading) {
            print("${state.favoriteList.length} Fav List"   );
            return Center(child: CircularProgressIndicator());
          } else if (state is MoviesDetailsError) {
            // Display error message
            return Center(child: Text(state.message));
          } else {
            // Default fallback when there are no favorite movies
            return Center(child: Text('No Favorite Movies'));
          }
        },
      ),
    );
  }
}
