import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/Constents/enums.dart';
import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';

import '../../domain/usecases/fetch_Movie_Details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;
  MovieDetailsBloc(this.fetchMovieDetailsUseCase) : super(const MovieDetailsState()) {
    on<FetchMovieDetailsEvent>((event, emit)async {

     final result = await  fetchMovieDetailsUseCase(MovieDetailsParams(event.movieId));

      result.fold(
              (failure) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: failure.message)),
              (movieDetails) => emit(state.copyWith(
              movieDetailsState: RequestState.loaded,
              movieDetails: movieDetails)));

    });
  }
}
