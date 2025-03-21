import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchPlayingNowMoviesEvent extends MoviesEvent {}

class FetchTopRatedMoviesEvent extends MoviesEvent {}

class FetchPopularMoviesEvent extends MoviesEvent {
  final int page;

  const FetchPopularMoviesEvent(this.page);

  @override
  List<Object> get props => [page];
}