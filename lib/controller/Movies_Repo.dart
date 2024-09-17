import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/controller/Movie_State.dart';


import '../model/models/Movie_Model.dart';

class MoviesRepo extends ChangeNotifier  {
  MoviesRepo();

  final _dio = Dio();

  List<Movie> _movies = [];
  Set<int> _favoriteMovies = {};
  Set<int> _watchedMovies = {};

  IList<Movie> get movies => _movies.lock;

  IList<Movie> get favoriteMovies =>
      _movies.where((m) => _favoriteMovies.contains(m.id)).toIList();

  IList<Movie> get watchedMovies =>
      _movies.where((m) => _watchedMovies.contains(m.id)).toIList();

  Future<IList<Movie>> fetchMovies() async {
    final res =
    await _dio.get("https://yts.mx/api/v2/list_movies.json?limit=50");

    final movies = (res.data["data"]["movies"] as Iterable<dynamic>)
        .map((i) => Movie(
      id: i["id"],
      title: i["title"],
      imageUrl: i["large_cover_image"],
      backgroundImageUrl: i["background_image"],
      year: i["year"],
      rating: i["rating"].toDouble(),
      runtime: i["runtime"],  isFavorite:false, isWatched:false ,
    ))
        .toList();

    _movies = movies;

    return movies.lock;
  }

  Movie? getMovieById(int movieId) {
    return _movies.where((m) => m.id == movieId).firstOrNull;

  }

  void toggleFavorite(int movieId) {
    if (_favoriteMovies.contains(movieId)) {
      _favoriteMovies.remove(movieId);
    } else {
      _favoriteMovies.add(movieId);
    }
    notifyListeners();

  }

  void toggleWatched(int movieId) {
    if (_watchedMovies.contains(movieId)) {
      _watchedMovies.remove(movieId);
    } else {
      _watchedMovies.add(movieId);
    }
    notifyListeners();
  }

  bool isFavorite(int movieId) => _favoriteMovies.contains(movieId);
  bool isWatched(int movieId) => _watchedMovies.contains(movieId);
}