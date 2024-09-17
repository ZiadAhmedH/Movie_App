import 'package:flutter/material.dart';
import 'package:movies_app/model/widgets/Movie_List_Widget.dart';
import 'package:provider/provider.dart';

import '../controller/movies_controller.dart';


class MoviesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MovieCubit>().state;

    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 43, 43, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(44, 43, 43, 1),
        title: Text('Movies'),
      ),
      body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent &&
                  !state.isLoading) {
                context.read<MovieCubit>().loadNextPage();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: state?.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return  MovieWidget(movie: movie);
              },
            ),

      ),
    );
  }
}
