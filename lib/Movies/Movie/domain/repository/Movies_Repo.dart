import 'package:dio/dio.dart';
import '../../../../controller/Constant/ApiEndPoints.dart';
import '../entities/Movie.dart';





class MovieRepository {
  final Dio _dio = Dio();

  Future<List<Movie>> fetchPopularMovies() async {
    try {
      final String url = '${ApiEndPoints.BASE_URL}/${ApiEndPoints.POPULAR_MOVIES}?language=en-US&page=1';

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
        final results = List<Map<String, dynamic>>.from(response.data['results']);
        print(results); // Print the results for debugging
        return results.map((movieData) => Movie.fromJson(movieData)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<List<Movie>> fetchPopularMoviesPagination(int page) async {
    try {
      final String url = '${ApiEndPoints.BASE_URL}/${ApiEndPoints.POPULAR_MOVIES}?language=en-US&page=$page';

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
        final results = List<Map<String, dynamic>>.from(response.data['results']);
        print(results); // Print the results for debugging
        return results.map((movieData) => Movie.fromJson(movieData)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }


}
