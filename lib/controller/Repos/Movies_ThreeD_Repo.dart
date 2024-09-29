import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';

import '../../model/models/Movie_Model.dart';
import 'Base_Movies_Repo.dart';

class ThreeDMovieRepository   extends ChangeNotifier implements BaseMoviesRepo {
  final _dio = Dio();
  List<Movie> _3dMovies = [];

  IList<Movie> get threeDMovies => _3dMovies.lock;

  bool _hasMorePages = true; // Track if there are more pages to fetch

  bool get hasMorePages => _hasMorePages; // Expose this for pagination checks




  Movie? get3DMovieById(int movieId ) {
    return _3dMovies.where((m) => m.id == movieId).firstOrNull;
  }



  @override
  Future<IList<Movie>> fetchMovies({required int page}) async {

    final res = await _dio.get(
      "https://yts.mx/api/v2/list_movies.json?quality=3D",
      queryParameters: {"limit": 20, "page": page,},
    );

    final movies = (res.data["data"]["movies"] as Iterable<dynamic>)
        .map((i) => Movie(
      id: i["id"],
      title: i["title"],
      imageUrl: i["large_cover_image"],
      backgroundImageUrl: i["background_image"],
      year: i["year"],
      rating: i["rating"].toDouble(),
      runtime: i["runtime"],
      isFavorite: false,
      isWatched: false, // Set is3DMovie to true
    ))
        .toList();

    _3dMovies = [..._3dMovies, ...movies]; // Append new movies to the list

    return movies.toIList(); // Ensure it returns an immutable list
  }





}
