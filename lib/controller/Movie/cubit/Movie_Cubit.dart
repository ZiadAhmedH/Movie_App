import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../Repo/Movies_Repo.dart';
import '../../ThreeDMovies/Repo/Movies_ThreeD_Repo.dart';
import 'Movie_State.dart';


class MovieCubit extends Cubit<MovieState> {
  final MoviesRepo _moviesRepo = GetIt.instance<MoviesRepo>();

  MovieCubit() : super(MovieState.initial());

  static MovieCubit of(BuildContext context) => context.read<MovieCubit>();


  // Fetch more movies when scrolling
  Future<void> fetchMoreMovies() async {
    if (!state.hasMoreMovies || state.isLoading) return;
    try {
      emit(state.copyWith(isLoading: true));
      final movies = await _moviesRepo.fetchMovies(page: state.currentPage + 1);
      emit(state.copyWith(
        movies: state.movies.addAll(movies),
        isLoading: false,
        hasMorePages: _moviesRepo.hasMorePages,
        currentPage: state.currentPage + 1,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // Fetch movies when the app starts

  Future<void> fetchMovies() async {
    try {
      final movies = await _moviesRepo.fetchMovies(page: 1);
      emit(state.copyWith(
        movies: movies,
        isLoading: false,
        hasMorePages: _moviesRepo.hasMorePages,
        currentPage: 1,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }


  // get random single movie

  Future<void> fetchRandomMovie() async {
    try {
      final randomMovie = await _moviesRepo.fetchRandomMovie();
      print("${randomMovie.toString()} hreeeeeeeeeeeeeee");
      emit(state.copyWith(
         randomMovie: randomMovie,
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }









}
