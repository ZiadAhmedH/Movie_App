import 'package:dio/dio.dart';
import 'package:movies_app/Core/Constents/EndPoints.dart';
import 'package:movies_app/Core/errors/exceptions.dart';
import 'package:movies_app/Movies/Movie/Data/Models/Movie_Model.dart';
import '../../../../../Core/network/error_message_model.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/usecases/remote/fetch_Movie_Details.dart';
import '../../domain/usecases/remote/fetch_Movie_cast.dart';
import '../../domain/usecases/remote/fetch_Popular_Movies_Pagination.dart';
import '../../domain/usecases/remote/fetch_Recommendation_Movies.dart';
import '../Models/cast_movie_model.dart';
import '../Models/movie_Details_model.dart';
import '../Models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> fetchPlayingNowMovies();

  Future<List<MovieModel>> fetchPopularMoviesPagination(PopularMoviesPaginationParams moviePopularPaginationParams);
  
  Future<List<MovieModel>> fetchTopRatedMovies();

  Future<MovieDetails> fetchMovieDetails(MovieDetailsParams movieDetailsParams);

  Future<List<RecommendationMovieModel>> fetchRecommendationMovies(RecommendationParams recommendationParams);

  Future<List<CastMovieModel>> fetchMovieCast(CastParams castParams);

  Future<List<MovieModel>> fetchSearchMovies(String query);


}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
 // access this method from the MovieRepository class Not efficient Way to do this Will
  // make an Contract BaseMovieReomteDataSource and extends it in this class
  @override
  Future<List<MovieModel>> fetchPlayingNowMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingApi);

    if(response.statusCode == 200){
      print("response");
      List<dynamic> data = response.data['results'];
      print(response.data['results']);
      return data.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
  }
  else{
    throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
  }

  }
  @override
  Future<List<MovieModel>> fetchPopularMoviesPagination(PopularMoviesPaginationParams params) async {
    final response = await Dio().get(
      "https://api.themoviedb.org/3/movie/popular",
      queryParameters: {
        "language": "en-US",
        "page": params.currentPage,
        "api_key": "bc7fc4bfb4720e0547a7facf1b65ba21"
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['results'];
      print(response.data['results']);
      return data.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
    } else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> fetchTopRatedMovies() async {
     final response = await Dio().get(ApiConstants.topRatedApi);

      if(response.statusCode == 200){
        List<dynamic> data = response.data['results'];
        return data.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
      }
      else{
        throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
      }
  }

  @override
  Future<MovieDetails> fetchMovieDetails(MovieDetailsParams movieDetailsParams) async {
    try {
      final response = await Dio().get(ApiConstants.movieDetails(movieDetailsParams.movieId));

      if (response.statusCode == 200) {
        if (response.data != null && response.data.isNotEmpty) {
          return MovieDetailsModel.fromJson(response.data);
        } else {
          throw Exception("API returned an empty response.");
        }
      } else {
        throw Exception("Failed to load movie details. Status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }


  @override
  Future<List<RecommendationMovieModel>> fetchRecommendationMovies(RecommendationParams recommendationParams) async {
    final response = await Dio().get(ApiConstants.recommendationMovies(recommendationParams.id));

    if(response.statusCode == 200){
      List<dynamic> data = response.data['results'];
      return data.map((movieJson) => RecommendationMovieModel.fromJson(movieJson)).toList();
    }
    else{
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<CastMovieModel>> fetchMovieCast(CastParams castParams)async {
    final response = await Dio().get(ApiConstants.movieCast(castParams.movieId));

    if(response.statusCode == 200){
      List<dynamic> data = response.data['cast'];
      print(response.data['cast']);

      return data.map((castJson) => CastMovieModel.fromJson(castJson)).toList();
    }
    else{
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<MovieModel>> fetchSearchMovies(String query)async {
   final response =await Dio().get(ApiConstants.searchMovie(query));

    if(response.statusCode == 200){
      List<dynamic> data = response.data['results'];
      print(response.data['results']);
      return data.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
    }
    else{
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

}