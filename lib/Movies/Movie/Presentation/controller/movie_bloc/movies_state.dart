import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/Constents/enums.dart';

import '../../../domain/entities/Movie.dart';

class MoviesState extends Equatable {
  final List<Movie> playingNowMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;

  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;

  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMessage;


  // search

  final List<Movie> searchMovies;
  final RequestState searchMoviesState;
  final String searchMessage;

  MoviesState copyWith(
      {List<Movie>? playingNowMovies,
      RequestState? nowPlayingMoviesState,
      String? nowPlayingMessage,
      List<Movie>? popularMovies,
      RequestState? popularMoviesState,
      String? popularMessage,
      List<Movie>? topRatedMovies,
      RequestState? topRatedMoviesState,
      String? topRatedMessage,

      List<Movie>? searchMovies,
      RequestState? searchMoviesState,
      String? searchMessage,
      }) {
    return MoviesState(
        playingNowMovies: playingNowMovies ?? this.playingNowMovies,
        nowPlayingMoviesState:
            nowPlayingMoviesState ?? this.nowPlayingMoviesState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularMoviesState: popularMoviesState ?? this.popularMoviesState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        searchMovies: searchMovies ?? this.searchMovies,
        searchMoviesState: searchMoviesState ?? this.searchMoviesState,
        searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  const MoviesState(
      {this.playingNowMovies = const [],
      this.nowPlayingMoviesState = RequestState.loading,
      this.nowPlayingMessage = '',

      this.popularMovies = const [],
      this.popularMoviesState = RequestState.loading,
      this.popularMessage = '',

      this.topRatedMovies = const [],
      this.topRatedMoviesState = RequestState.loading,
      this.topRatedMessage = '',

      this.searchMovies = const [],
      this.searchMoviesState = RequestState.idle,
      this.searchMessage = '',
      });

  @override
  List<Object> get props => [
        playingNowMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,

        popularMovies,
        popularMoviesState,
        popularMessage,

        topRatedMovies,
        topRatedMoviesState,
        topRatedMessage,

        searchMovies,
        searchMoviesState,
        searchMessage,
      ];
}
