import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/Movie/cubit/Movie_Cubit.dart';
import '../../../controller/commenMovieState.dart';
import '../../../model/models/Movie_Model.dart';
import '../../../model/widgets/Movie_List_Widget.dart';



class MoviesScreen extends StatefulWidget {
  final MovieStateInterface movieState; // Use interface here
   Function fetchMoreMovies; // Function to fetch more movies

   MoviesScreen({Key? key, required this.movieState, required this.fetchMoreMovies}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Listen to the scroll controller
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _loadMoreMovies();
      }
    });
  }

  void _loadMoreMovies() {
    if (widget.movieState.hasMoreMovies && !widget.movieState.isLoading) {
      widget.fetchMoreMovies();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MovieCubit>().state;

    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 43, 43, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(44, 43, 43, 1),
        title: Text('Movies'),
      ),
      body: GridView.builder(
        controller: _scrollController, // Attach scroll controller
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.7,
        ),
        padding: const EdgeInsets.all(10.0), // Padding around the grid
        itemCount: state.movies.length + (state.hasMoreMovies ? 1 : 0), // Extra item for loading indicator
        itemBuilder: (context, index) {
          // If the index is the last and we have more movies to load
          if (index == state.movies.length) {
            return state.hasMoreMovies && !state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink();
          }

          // Get the movie from the list
          final movie = state.movies[index];
          return MovieWidget(movie: movie);
        },
      ),
    );
  }
}
