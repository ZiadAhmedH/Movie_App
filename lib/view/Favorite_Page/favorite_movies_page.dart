import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../controller/Movie_Cubit/Movie_State.dart';
import '../../controller/Repos/Movies_Repo.dart';
import '../../model/widgets/Movie_List_Widget.dart';
import '../../controller/Movie_Cubit/Movie_Cubit.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Column(
        children: [

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: state..length,
          //     itemBuilder: (context, index) {
          //       return  MovieWidget(movie:state.favoriteMovies[index]);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
