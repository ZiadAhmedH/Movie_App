import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movie_details_bloc.dart';
import '../Movies/Movie/Data/datasource/movie_remote_data_source.dart';
import '../Movies/Movie/Data/repository/movies_repository.dart';
import '../Movies/Movie/Presentation/controller/movies_bloc.dart';
import '../Movies/Movie/domain/repository/base_Movie_Repository.dart';
import '../Movies/Movie/domain/usecases/fetch_Movie_Details.dart';
import '../Movies/Movie/domain/usecases/fetch_Playing_Now_Movies.dart';
import '../Movies/Movie/domain/usecases/fetch_Popular_Movies_Pagination.dart';
import '../Movies/Movie/domain/usecases/fetch_Recommendation_Movies.dart';
import '../Movies/Movie/domain/usecases/fetch_Top_Rated_Movies.dart';

final sl = GetIt.instance;


class ServiceLocator{

    void init() {
        print("Initializing Service Locator..."); // Debug log

        // Register use cases first
        sl.registerLazySingleton(() => FetchPlayingNowMovies(sl()));
        sl.registerLazySingleton(() => FetchPopularMoviesPagination(sl()));
        sl.registerLazySingleton(() => FetchTopRatedMovies(sl()));
        sl.registerLazySingleton(() => FetchMovieDetailsUseCase(sl()));
        sl.registerLazySingleton(() => FetchRecommendationMovies(sl()));

        // Register repository & data source
        sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));
        sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

        // Register Blocs after dependencies are available
        sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
        sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
    }
}
