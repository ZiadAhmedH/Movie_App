import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/Constents/enums.dart';

import '../../domain/entities/Movie.dart';

class MoviesState extends Equatable {
  final List<Movie> playingNowMovies;

  final RequestState nowPlayingMoviesState;

  final String message;

  const MoviesState({this.playingNowMovies = const[], this.nowPlayingMoviesState = RequestState.loading, this.message = ''});

  @override
  List<Object> get props => [playingNowMovies, nowPlayingMoviesState, message,];


}