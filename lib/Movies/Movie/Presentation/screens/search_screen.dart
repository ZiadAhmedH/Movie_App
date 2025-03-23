import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Constents/enums.dart';
import '../../../../dependancy_Injection/service_DI.dart';
import '../controller/movie_bloc/movies_bloc.dart';
import '../controller/movie_bloc/movies_event.dart';
import '../controller/movie_bloc/movies_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Movies')),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search for a movie...',
              border: OutlineInputBorder(),
            ),
            onChanged: (query) {
              if (query.isNotEmpty) {
                context.read<MoviesBloc>().add(FetchSearchMoviesEvent(query));
              }
            },
          ),
          Expanded(
            child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                // use switch case to check the state of the movies
                switch (state.searchMoviesState) {
                  case RequestState.loading:
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.loaded:
                    return ListView.builder(
                      itemCount: state.searchMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.searchMovies[index];
                        return ListTile(
                          title: Text(movie.title!),
                          subtitle: Text(movie.overview!),
                        );
                      },
                    );
                  case RequestState.error:
                    return const Center(child: Text('Failed to load movies'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
