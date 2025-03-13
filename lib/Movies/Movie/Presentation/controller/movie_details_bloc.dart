import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/Constents/enums.dart';
import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';
import 'package:movies_app/Movies/Movie/domain/entities/recommendation_movie.dart';

import '../../domain/usecases/fetch_Movie_Details.dart';
import '../../domain/usecases/fetch_Recommendation_Movies.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;
  final FetchRecommendationMovies fetchRecommendationMovies;
  MovieDetailsBloc(this.fetchMovieDetailsUseCase, this.fetchRecommendationMovies) : super(const MovieDetailsState()) {
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

    on<FetchMovieRecommendationsEvent>((event, emit) async {
      final result = await fetchRecommendationMovies(RecommendationParams(event.movieId));
      result.fold(
              (failure) => emit(state.copyWith(
              recommendationsState: RequestState.error,
              recommendationsMessage: failure.message)),
              (recommendationMovies) => emit(state.copyWith(
              recommendationsState: RequestState.loaded,
              recommendations: recommendationMovies)));
    });
  }
}
