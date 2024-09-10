import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

class MoviesController extends ChangeNotifier {
  final _dio = Dio();

  List<Movie> _movies = [];
  IList<Movie> get movies => _movies.lock;


  List<Movie> _favoriteMovies = [];
  IList<Movie> get favoriteMovies => _favoriteMovies.lock;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchMovies() async {
    _isLoading = true;
    notifyListeners();
    final res = await _dio.get("https://yts.mx/api/v2/list_movies.json");
    _isLoading = false;
    _movies = (res.data["data"]["movies"] as Iterable<dynamic>)
        .map((i) => Movie(
      title: i["title"],
      imageUrl: i["large_cover_image"],
      isFavorite: false,
    ))
        .toList();
    notifyListeners();
  }

  void toggleFavorite(Movie movie) {
    final index = _movies.indexOf(movie);
    final updatedMovie = movie.copyWith(isFavorite: !movie.isFavorite);
    _movies[index] = updatedMovie;

    if (updatedMovie.isFavorite) {
      _favoriteMovies.add(updatedMovie);
    } else {
      _favoriteMovies.remove(movie);
    }

    notifyListeners();
  }
}

class Movie {
  final String title;
  final String imageUrl;
  final bool isFavorite;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.isFavorite,
  });

  Movie copyWith({
    String? title,
    String? imageUrl,
    bool? isFavorite,
  }) =>
      Movie(
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  String toString() =>
      "Movie(title: $title, imageUrl: $imageUrl, isFavorite: $isFavorite)";

  operator ==(o) =>
      o is Movie &&
          o.title == title &&
          o.imageUrl == imageUrl &&
          o.isFavorite == isFavorite;
}