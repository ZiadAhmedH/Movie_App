import 'package:bloc/bloc.dart';
import 'package:movies_app/Movies/Movie/Presentation/controller/movies_state.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/fetch_Popular_Movies_Pagination.dart';
import '../../../../Core/Constents/enums.dart';
import '../../domain/usecases/fetch_Playing_Now_Movies.dart';
import '../../domain/usecases/fetch_Top_Rated_Movies.dart';
import 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  final FetchPlayingNowMovies playingNowMovies;

  final FetchPopularMoviesPagination popularMovies;

  final FetchTopRatedMovies topRatedMovies;



  MoviesBloc(this.playingNowMovies , this.popularMovies , this.topRatedMovies ) : super(const MoviesState()) {
    on<FetchPlayingNowMoviesEvent>((event, emit) async {

      final result = await playingNowMovies.call();

      result.fold(
          (failure) => emit(state.copyWith(
              nowPlayingMoviesState: RequestState.error,
              nowPlayingMessage: failure.message)),
          (movies) => emit(state.copyWith(
              nowPlayingMoviesState: RequestState.loaded,
              playingNowMovies: movies)));
    });

    on<FetchPopularMoviesEvent>((event, emit) async {
      final result = await  popularMovies.call(currentPage: event.page);


      result.fold(
          (failure) => emit(state.copyWith(
              popularMoviesState: RequestState.error,
              popularMessage: failure.message)),
          (movies) => emit(state.copyWith(
              popularMoviesState: RequestState.loaded,
              popularMovies: movies)));
    });

    on<FetchTopRatedMoviesEvent>((event, emit) async {
      final result = await topRatedMovies.call();


      result.fold(
          (failure) => emit(state.copyWith(
              topRatedMoviesState: RequestState.error,
              topRatedMessage: failure.message)),
          (movies) => emit(state.copyWith(
              topRatedMoviesState: RequestState.loaded,
              topRatedMovies: movies)));
    });

  }
}
