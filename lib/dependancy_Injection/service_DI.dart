import 'package:get_it/get_it.dart';
import '../Movies/Movie/Data/datasource/movie_remote_data_source.dart';
import '../Movies/Movie/Data/repository/movies_repository.dart';
import '../Movies/Movie/Presentation/controller/movies_bloc.dart';
import '../Movies/Movie/domain/repository/base_Movie_Repository.dart';
import '../Movies/Movie/domain/usecases/fetch_Playing_Now_Movies.dart';

final sl = GetIt.instance;


class ServiceLocator{

void init() {

    // bloc using registerFactory ;> when we want to create a new instance of the bloc every time
    sl.registerFactory(() => MoviesBloc(sl()));

    sl.registerLazySingleton(() => FetchPlayingNowMovies(sl()));
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

  }
}
