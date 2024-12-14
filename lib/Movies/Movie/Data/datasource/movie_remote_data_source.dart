import 'package:dio/dio.dart';
import 'package:movies_app/Core/Constents/EndPoints.dart';
import 'package:movies_app/Core/errors/exceptions.dart';
import 'package:movies_app/Movies/Movie/Data/Models/Movie_Model.dart';

import '../../../../Core/network/error_message_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> fetchPlayingNowMovies();

}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
 // access this method from the MovieRepository class Not efficient Way to do this Will
  // make an Contract BaseMovieReomteDataSource and extends it in this class
  @override
  Future<List<MovieModel>> fetchPlayingNowMovies() async {
    final response = await Dio().get(ApiConstant.nowPlayingApi);

    if(response.statusCode == 200){
      List<dynamic> data = response.data['results'];
      return data.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
  }
  else{
    throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
  }

  }

}