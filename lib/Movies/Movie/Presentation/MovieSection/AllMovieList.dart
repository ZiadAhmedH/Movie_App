import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../cubit/Movie_Cubit.dart';
import '../../cubit/Movie_State.dart';
import '../Widgets/Movie_List_Widget.dart';

class ViewAllMovies extends StatefulWidget {
  @override
  _ViewAllMoviesState createState() => _ViewAllMoviesState();
}

class _ViewAllMoviesState extends State<ViewAllMovies> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        context.read<MovieCubit>().fetchMorePopularMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MovieCubit>().state;

    if (state is MovieLoading) {
      return Center(child: LoadingAnimationWidget.dotsTriangle(color: Colors.orangeAccent, size: 50));
    } else if (state is MovieError) {
      return Center(child: Text('Error: ${state.error}'));
    } else if (state is MovieLoaded) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
        body: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          itemCount: state.movies.length + (state.hasMoreMovies ? 1 : 0), // Add loading indicator if more movies
          itemBuilder: (context, index) {
            if (index == state.movies.length && state.hasMoreMovies) {
              return  Center(child: LoadingAnimationWidget.discreteCircle(color: Colors.white10, size: 20) ); // Loading more indicator
            }
            final movie = state.movies[index];
            return MovieWidget(movie: movie);
          },
        ),
      );
    }
    return const Center(child: Text('No movies available'));
  }
}
