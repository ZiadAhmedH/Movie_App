import 'package:bloc/bloc.dart';
import 'package:movies_app/Movies/Movie/Data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movies_state.dart';
import 'package:movies_app/Movies/Movie/domain/repository/base_Movie_Repository.dart';

import '../../../../Core/Constents/enums.dart';
import '../../Data/repository/movies_repository.dart';
import '../../domain/usecases/fetch_Playing_Now_Movies.dart';
import 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<FetchPlayingNowMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource remoteDataSource = MovieRemoteDataSource();

      BaseMovieRepository repository = MoviesRepository(remoteDataSource);

      final result = await FetchPlayingNowMovies(repository).call();

      emit(const MoviesState(nowPlayingMoviesState: RequestState.loaded));

      result.fold(
          (failure) => emit(MoviesState(
              nowPlayingMoviesState: RequestState.error,
              message: failure.message)),
          (movies) => emit(MoviesState(
              nowPlayingMoviesState: RequestState.loaded,
              playingNowMovies: movies)));
    });

    
  }
}
