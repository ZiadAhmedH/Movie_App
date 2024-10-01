import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/Movie_Details_Cubit/cubit/detials_movie_cubit.dart';
import '../../controller/Movie_Details_Cubit/cubit/detials_movie_state.dart';
import '../../model/models/Movie_Model.dart';
import 'ContentPage.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesDetailsCubit()..fetchMovieDetails(movieId),
      child: BlocBuilder<MoviesDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          Widget body;

          // Handle the different states of the movie details
          if (state is MoviesDetailsLoading) {
            body = const Center(child: CircularProgressIndicator());
          } else if (state is MoviesDetailsError) {
            body = _buildErrorBody(state.message);
          } else if (state is MoviesDetailsLoaded) {
            body = MovieDetailsPageContent(moviesDetailsState: state);
          } else {
            body = const Center(child: Text('Unexpected state'));
          }

          return Scaffold(
            backgroundColor: const Color.fromRGBO(44, 43, 43, 1),
            appBar: AppBar(
              title: const Text('Movie Details'),
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            extendBodyBehindAppBar: true,
            body: body,
          );
        },
      ),
    );
  }

  Widget _buildErrorBody(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
