import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../Core/Constents/enums.dart';
import '../../../../dependancy_Injection/service_DI.dart';
import '../controller/movie_bloc/movies_bloc.dart';
import '../controller/movie_bloc/movies_event.dart';
import '../controller/movie_bloc/movies_state.dart';
import 'movie_detail_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for a movie...',
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  context.read<MoviesBloc>().add(FetchSearchMoviesEvent(query));
                }
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                switch (state.searchMoviesState) {
                  case RequestState.loading:
                    return _buildShimmerEffect();
                  case RequestState.loaded:
                    return _buildMovieList(state);
                  case RequestState.error:
                    return const Center(
                      child: Text(
                        'Failed to load movies',
                        style: TextStyle(color: Colors.white),
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

  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[600]!,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMovieList(MoviesState state) {
    return ListView.builder(
      itemCount: state.searchMovies.length,
      itemBuilder: (context, index) {
        final movie = state.searchMovies[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  width: 50,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.movie, size: 50, color: Colors.white70),
                ),
              ),
              title: Text(
                movie.title!,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                movie.overview!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white70),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: movie.id!,)));
              },
            ),
          ),
        );
      },
    );
  }
}