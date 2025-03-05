import 'package:get_it/get_it.dart';
import '../Movies/Movie/Data/datasource/movie_remote_data_source.dart';
import '../Movies/Movie/Data/repository/movies_repository.dart';
import '../Movies/Movie/Presentation/controller/movies_bloc.dart';
import '../Movies/Movie/domain/repository/base_Movie_Repository.dart';
import '../Movies/Movie/domain/usecases/fetch_Playing_Now_Movies.dart';
import '../Movies/Movie/domain/usecases/fetch_Popular_Movies_Pagination.dart';
import '../Movies/Movie/domain/usecases/fetch_Top_Rated_Movies.dart';

final sl = GetIt.instance;


class ServiceLocator{

void init() {

    // bloc using registerFactory ;> when we want to create a new instance of the bloc every time
    sl.registerFactory(() => MoviesBloc(sl() , sl() , sl()));

    sl.registerLazySingleton(() => FetchPlayingNowMovies(sl()));
    sl.registerLazySingleton(() => FetchPopularMoviesPagination(sl()));
    sl.registerLazySingleton(()=> FetchTopRatedMovies(sl()));

    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

  }
}
