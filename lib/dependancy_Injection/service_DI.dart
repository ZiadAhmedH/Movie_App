import 'package:get_it/get_it.dart';
import 'package:movies_app/controller/Movie_Details_Cubit/Data/Repo/Movie_Details_Repo.dart';
import 'package:movies_app/controller/Tv_Series/Data/Repo/Series_Repo.dart';
import 'package:movies_app/controller/Tv_Series_Details/Data/Repo/Series_Details_Repo.dart';

import '../controller/Movie/Data/Repo/Movies_Repo.dart';



final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepository());

  getIt.registerLazySingleton<MovieDetailsRepo>(() => MovieDetailsRepo());

  getIt.registerLazySingleton<SeriesRepository>(() => SeriesRepository());

  getIt.registerLazySingleton<SeriesDetailsRepository>(() => SeriesDetailsRepository());

}
