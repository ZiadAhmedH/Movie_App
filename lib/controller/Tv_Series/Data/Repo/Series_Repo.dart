import 'package:dio/dio.dart';
import 'package:movies_app/controller/Constant/ApiEndPoints.dart';
import '../Models/Series_Model.dart';

class SeriesRepository {
  final Dio _dio = Dio();

  Future<List<Series>?> fetchSeries() async {
    try {
      var response = await _dio.get(
        "https://api.themoviedb.org/3/trending/tv/day?language=en-US&page=1",
        options: Options(
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYzdmYzRiZmI0NzIwZTA1NDdhN2ZhY2YxYjY1YmEyMSIsIm5iZiI6MTcyODUyNTExOC44ODY3NDQsInN1YiI6IjY2ZmMxNzliMDYxYWZlMTE0YmYxODg5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.naGb1y_UcM9WBG2Hcw7FRBTOCJmu9End45WOE-xJ7pA",

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

  // Future<List<Series>> fetchSeriesPagination(int page) async {
}
