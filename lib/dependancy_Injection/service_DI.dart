import 'package:get_it/get_it.dart';

import '../Movies/Movie/Data/datasource/movie_remote_data_source.dart';
import '../Movies/Movie/Data/repository/movies_repository.dart';
import '../Movies/Movie/domain/repository/base_Movie_Repository.dart';
import '../Movies/Movie/domain/usecases/fetch_Playing_Now_Movies.dart';



final sl = GetIt.instance;


class ServiceLocator{

void init() {

  // add the usecases
    sl.registerLazySingleton(() => FetchPlayingNowMovies(sl()));

  // add the repositories
  sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

  // add the data sources

  sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

  }
}
