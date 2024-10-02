import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/models/Movie_Model.dart';
import '../../Repos/Base_Movies_Repo.dart';



class MoviesRepo  implements BaseMoviesRepo{
  MoviesRepo();
  static MoviesRepo of(BuildContext context) {
    return Provider.of<MoviesRepo>(context, listen: false);
  }
  final _dio = Dio();
  List<Movie> _movies = [];

  bool _hasMorePages = true; // Track if there are more pages to fetch

  IList<Movie> get movies => _movies.lock;


  bool get hasMorePages => _hasMorePages; // Expose this for pagination checks

  @override
  Future<IList<Movie>> fetchMovies({required int page}) async {
    final res = await _dio.get(
      "https://yts.mx/api/v2/list_movies.json",
      queryParameters: {"limit": 20, "page": page},
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
      isWatched: false, genres: [],
    ))
        .toList();

    _movies = [..._movies, ...movies]; // Append new movies to the list

    return movies.toIList(); // Ensure it returns an immutable list
  }

  // Fetch a single random movie
 // make the random movie  from the list of movies









}