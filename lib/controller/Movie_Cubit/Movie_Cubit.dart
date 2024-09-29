import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:state_notifier/state_notifier.dart';

import '../../model/models/Movie_Model.dart';
import '../Repos/Movies_Repo.dart';
import '../Repos/Movies_ThreeD_Repo.dart';
import '../Shared_Cubit/favorites_and_watched_cubit.dart';
import 'Movie_State.dart';


class MovieCubit extends Cubit<MovieState> {
  final MoviesRepo moviesRepo;

  final FavoritesAndWatchedCubit favoritesCubit ;
  MovieCubit(this.moviesRepo, this.favoritesCubit) : super(MovieState.initial());

  static MovieCubit of(BuildContext context) => context.read<MovieCubit>();


  // Fetch more movies when scrolling
  Future<void> fetchMoreMovies() async {
    if (!state.hasMoreMovies || state.isLoading) return;
    try {
      emit(state.copyWith(isLoading: true));
      final movies = await moviesRepo.fetchMovies(page: state.currentPage + 1);
      emit(state.copyWith(
        movies: state.movies.addAll(movies),
        isLoading: false,
        hasMorePages: moviesRepo.hasMorePages,
        currentPage: state.currentPage + 1,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // Fetch movies when the app starts

  Future<void> fetchMovies() async {
    try {
      final movies = await moviesRepo.fetchMovies(page: 1);
      emit(state.copyWith(
        movies: movies,
        isLoading: false,
        hasMorePages: moviesRepo.hasMorePages,
        currentPage: 1,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void toggleFavorite(Movie movie) {
    if (favoritesCubit.state.favs.contains(movie)) {
      favoritesCubit.toggleFavorite(movie);
    } else {
      favoritesCubit.toggleFavorite(movie);
    }
  }

  void markAsWatched(Movie movie) {
    if (favoritesCubit.state.watched.contains(movie)) {
      favoritesCubit.toggleWatched(movie);
    } else {
      favoritesCubit.toggleWatched(movie);
    }
  }






}
