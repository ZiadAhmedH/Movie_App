import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/Movies/Movie/Presentation/components/search_movie_components/movie_search_card.dart';

import '../../../../Core/Constents/enums.dart';
import '../controller/movie_bloc/movies_bloc.dart';
import '../controller/movie_bloc/movies_event.dart';
import '../controller/movie_bloc/movies_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
           SizedBox(height: MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),

                      FaIcon(FontAwesomeIcons.search , color: Theme.of(context).colorScheme.primary,),

                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search movies...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        cursorColor: Theme.of(context).colorScheme.primary,
                        onChanged: (query) {
                          if (query.isNotEmpty) {
                            context.read<MoviesBloc>().add(FetchSearchMoviesEvent(query));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                switch (state.searchMoviesState) {
                  case RequestState.loading:
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.loaded:
                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: state.searchMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.searchMovies[index];
                        return MovieCardSearch(movie: movie);
                      },
                    );
                  case RequestState.error:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline, size: 48, color: Colors.red),
                          const SizedBox(height: 16),
                          Text(
                            'No movies found',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Try searching for something else',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  case RequestState.idle:
                    return const Center(
                      child: Text(
                        'Search for movies',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
