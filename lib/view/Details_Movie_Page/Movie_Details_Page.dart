import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/detials_movie_state.dart';
import 'package:provider/provider.dart';
import '../../controller/Movie_Details_Cubit/detials_movie_cubit.dart';
import '../../controller/Movies_Repo.dart';
import '../../model/models/Movie_Model.dart';
import 'ContentPage.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movieId;


   MovieDetailsPage({super.key, required this.movieId,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesDetailsCubit(movieId , context.read<MoviesRepo>()),
      child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
        builder: (context, state) {
          final Widget body;
          switch (state) {
            case MoviesDetailsLoading():
              body = const Center(child: CircularProgressIndicator());
            case MoviesDetailsError():
              body = const Center(child: Icon(Icons.error, color: Colors.red));
            case MoviesDetailsLoaded():
              body = MovieDetailsPageContent(moviesDetailsState: state ,);
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
                  fontWeight: FontWeight.bold),
            ),
            extendBodyBehindAppBar: true,
            body: body,
          );

        },
      ),
    );
  }
}
