import 'package:dio/dio.dart';
import 'package:movies_app/Core/errors/exceptions.dart';
import 'package:movies_app/Tv_series/data/models/tv_model.dart';

import '../../../Core/Constents/EndPoints.dart';
import '../../../Core/network/error_message_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> fetchTrendingTvSeries();
}

class TvRemoteDataSource extends BaseTvRemoteDataSource{
  @override
  Future<List<TvModel>> fetchTrendingTvSeries()async {
       final response = await Dio().get(ApiTv.trendingApi);

        if(response.statusCode == 200){
          final List<dynamic> tvList = response.data['results'];
          return tvList.map((e) => TvModel.fromJson(e)).toList();

        }else{
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
  }

}
