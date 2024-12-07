import 'package:dio/dio.dart';
import 'package:movies_app/Movies/Movie/Data/Models/Movie_Model.dart';

class MovieRemoteDataSource{


 Future<List<MovieModel>> FetchPlayingNowMovies() async {
    final response = await Dio().get('https://api.themoviedb.org/3/movie/now_playing?api_key=<<api_key>>&language=en-US&page=1');

    if(response.statusCode == 200){
      List<dynamic> data = response.data['results'];
      return data.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
  }
  else{
    throw Exception('Failed to load movies');
  }

  return [];
  }

}