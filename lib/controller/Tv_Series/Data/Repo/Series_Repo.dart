import 'package:dio/dio.dart';
import 'package:movies_app/controller/Constant/ApiEndPoints.dart';
import '../Models/Series_Model.dart';

class SeriesRepository {
  final Dio _dio = Dio();

  Future<List<Series>?> fetchSeries() async {
    try {
      var response = await _dio.get(
        "${ApiEndPoints.BASE_URL}${ApiEndPoints.Popular_Tv_Shows}?language=en-US&page=1",
        options: Options(
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${ApiEndPoints.API_KEY}",

          },
        ),
      );

      print(response.data);
      List<dynamic> data = response.data['results'];
      print(data);
      return data.map((seriesJson) => Series.fromJson(seriesJson)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

   Future<List<Series>> fetchSeriesPagination(int page) async {
    try {
      var response = await _dio.get(
        "${ApiEndPoints.BASE_URL}${ApiEndPoints.Popular_Tv_Shows}?language=en-US&page=$page",
        options: Options(
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${ApiEndPoints.API_KEY}",
          },
        ),
      );

      List<dynamic> data = response.data['results'];
      return data.map((seriesJson) => Series.fromJson(seriesJson)).toList();
    } catch (e) {
      print(e);
      return [];
    }
   }
}
