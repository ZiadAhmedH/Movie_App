import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/Constant/ApiEndPoint.dart';

import '../Models/Movie_Deatails_Model.dart';

class MovieDetailsRepo {

  final Dio _dio = Dio();

  MovieDetailsRepo();

  Future<MovieDetails> getMovieDetails(int movieId) async {
    try {
      final String url = '${ApiEndPoints.BASE_URL}$movieId?language=en-US}';

      final options = Options(
        headers: {
          "accept": "application/json",
           "Authorization": "Bearer ${ApiEndPoints.API_KEY}",
        },
      );

      print("Request URL: $url");
      print("Request Headers: ${options.headers}");

      final response = await _dio.get(url, options: options);

      if (response.statusCode == 200) {
        final movieDetails = MovieDetails.fromJson(response.data);
        print(movieDetails);
        return movieDetails;
      } else {
        throw Exception('Failed to load movie details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }
}

