import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/Constents/enums.dart';

import '../../domain/entities/Movie.dart';

class MoviesState extends Equatable {
  final List<Movie> playingNowMovies;

  final RequestState NowPlayingMoviesState;

  final String message;

  MoviesState({this.playingNowMovies = const[], this.NowPlayingMoviesState = RequestState.loading, this.message = ''});

  @override
  List<Object> get props => [playingNowMovies, NowPlayingMoviesState, message,];


}