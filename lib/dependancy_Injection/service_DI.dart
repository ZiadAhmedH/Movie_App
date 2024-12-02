import 'package:get_it/get_it.dart';
import 'package:movies_app/controller/Tv_Series/Data/Repo/Series_Repo.dart';
import 'package:movies_app/controller/Tv_Series_Details/Data/Repo/Series_Details_Repo.dart';
import 'package:movies_app/controller/Tv_Series_Details/Data/local/series_dao.dart';

import '../Movies/Movie/domain/repository/Movies_Repo.dart';
import '../Movies/Movie_Details_Cubit/Data/Local/movie_dao.dart';
import '../Movies/Movie_Details_Cubit/Data/Repo/Movie_Details_Repo.dart';



final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepository());

  getIt.registerLazySingleton<MovieDetailsRepo>(() => MovieDetailsRepo());

  getIt.registerLazySingleton<SeriesRepository>(() => SeriesRepository());


  getIt.registerLazySingleton<SeriesDetailsRepository>(() => SeriesDetailsRepository());

  getIt.registerLazySingleton<MovieDao>(() => MovieDao());

  getIt.registerLazySingleton<SeriesDao>(()=> SeriesDao());


}
