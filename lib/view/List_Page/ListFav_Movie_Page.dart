import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/detials_movie_cubit.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/detials_movie_state.dart';
import 'package:movies_app/model/widgets/Movie_List_Widget.dart';

class ListMoviePage extends StatelessWidget {
  const ListMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(44, 43, 43, 1),

      body: BlocProvider(
        create: (context) => MoviesDetailsCubit(),
        child: BlocBuilder<MoviesDetailsCubit, MovieDetailsState>(

          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child:state.favoriteList.isNotEmpty ?   ListView.builder(
                    itemCount: state.favoriteList.length,
                    itemBuilder: (context, index) {
                      return MovieWidget(movie: state.favoriteList[index]);
                    },
                  ) : Center(child: Text('No Favorite Movies'),),
                ),
              ],
            );
          },
        ),
      ),


    );
  }
}
