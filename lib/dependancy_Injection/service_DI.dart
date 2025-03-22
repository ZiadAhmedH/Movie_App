import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movie_detail_bloc/movie_details_bloc.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/local/save_fav_Movie.dart';
import '../Movies/Movie/Data/datasource/movie_local_data_source.dart';
import '../Movies/Movie/Data/datasource/movie_remote_data_source.dart';
import '../Movies/Movie/Data/repository/movies_repository.dart';
import '../Movies/Movie/Presentation/controller/fav_bloc_movie/fav_movie_bloc.dart';
import '../Movies/Movie/Presentation/controller/movie_bloc/movies_bloc.dart';
import '../Movies/Movie/domain/repository/base_Movie_Repository.dart';
import '../Movies/Movie/domain/usecases/local/get_fav_movies.dart';
import '../Movies/Movie/domain/usecases/remote/fetch_Movie_Details.dart';

import '../Movies/Movie/domain/usecases/remote/fetch_Movie_cast.dart';
import '../Movies/Movie/domain/usecases/remote/fetch_Playing_Now_Movies.dart';
import '../Movies/Movie/domain/usecases/remote/fetch_Popular_Movies_Pagination.dart';
import '../Movies/Movie/domain/usecases/remote/fetch_Recommendation_Movies.dart';
import '../Movies/Movie/domain/usecases/remote/fetch_Top_Rated_Movies.dart';

final sl = GetIt.instance;


class ServiceLocator{

    void init() {
        print("Initializing Service Locator..."); // Debug log

        // Register use cases first  remote
        sl.registerLazySingleton(() => FetchPlayingNowMovies(sl()));
        sl.registerLazySingleton(() => FetchPopularMoviesPagination(sl()));
        sl.registerLazySingleton(() => FetchTopRatedMovies(sl()));
        sl.registerLazySingleton(() => FetchMovieDetailsUseCase(sl()));
        sl.registerLazySingleton(() => FetchRecommendationMovies(sl()));
        sl.registerLazySingleton(() => FetchMovieCast(sl()));

        // Register use cases first  local

        sl.registerLazySingleton(() => GetFavMovies(sl()));
        sl.registerLazySingleton(() => SaveFavMovie(sl()));


        // Register repository & data source
        sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl() , sl()));
        sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
        sl.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl());

        // Register Blocs after dependencies are available
        sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
        sl.registerFactory(() => MovieDetailsBloc(sl(), sl() , sl()));
        sl.registerFactory(() => FavMovieBloc(sl(), sl() , sl()));
    }
}
