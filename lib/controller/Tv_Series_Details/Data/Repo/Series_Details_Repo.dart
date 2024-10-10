import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Constant/ApiEndPoints.dart';
import '../Models/Series_Details_Model.dart';

class SeriesDetailsRepository {

  final Dio _dio = Dio();


  Future<SeriesDetails> getSeriesDetails(int seriesId) async {
    try {
      final String url = '${ApiEndPoints.BASE_URL}tv/$seriesId?language=en-US}';

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
        final movieDetails = SeriesDetails.fromJson(response.data);
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