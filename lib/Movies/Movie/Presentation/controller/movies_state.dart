import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/Constents/enums.dart';

import '../../domain/entities/Movie.dart';

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

  MoviesState copyWith(
      {List<Movie>? playingNowMovies,
      RequestState? nowPlayingMoviesState,
      String? nowPlayingMessage,
      List<Movie>? popularMovies,
      RequestState? popularMoviesState,
      String? popularMessage,
      List<Movie>? topRatedMovies,
      RequestState? topRatedMoviesState,
      String? topRatedMessage}) {
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
        topRatedMessage: topRatedMessage ?? this.topRatedMessage);
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
      this.topRatedMessage = ''});

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
        topRatedMessage
      ];
}
