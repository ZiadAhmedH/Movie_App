import 'package:bloc/bloc.dart';
import 'package:movies_app/Core/usecase/base_Use_Case.dart';
import 'package:movies_app/Movies/Movie/domain/usecases/remote/search_movie.dart';
import '../../../../../Core/Constents/enums.dart';
import '../../../domain/usecases/remote/fetch_Playing_Now_Movies.dart';
import '../../../domain/usecases/remote/fetch_Popular_Movies_Pagination.dart';
import '../../../domain/usecases/remote/fetch_Top_Rated_Movies.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  final FetchPlayingNowMovies playingNowMovies;

  final FetchPopularMoviesPagination popularMovies;

  final FetchTopRatedMovies topRatedMovies;

  final SearchMovieUseCase searchMovieUseCase;

  MoviesBloc(this.playingNowMovies , this.popularMovies , this.topRatedMovies ,this.searchMovieUseCase ) : super(const MoviesState()) {
    on<FetchPlayingNowMoviesEvent>(_getPlayingNowMovies);

    on<FetchPopularMoviesEvent>(_getPopularMovies);

    on<FetchTopRatedMoviesEvent>(_getTopRatedMovies);

    on<FetchSearchMoviesEvent>(_searchMovies);

  }

  _getPlayingNowMovies(FetchPlayingNowMoviesEvent event, Emitter<MoviesState> emit)  async {
    final result = await playingNowMovies(const NoParams());
    result.fold(
            (failure) => emit(state.copyWith(
            nowPlayingMoviesState: RequestState.error,
            nowPlayingMessage: failure.message)),
            (movies) => emit(state.copyWith(
            nowPlayingMoviesState: RequestState.loaded,
            playingNowMovies: movies)));
  }

  _getPopularMovies(FetchPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await  popularMovies(PopularMoviesPaginationParams(1));
    result.fold(
            (failure) => emit(state.copyWith(
            popularMoviesState: RequestState.error,
            popularMessage: failure.message)),
            (movies) => emit(state.copyWith(
            popularMoviesState: RequestState.loaded,
            popularMovies: movies)));
  }

  _getTopRatedMovies(FetchTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await topRatedMovies(const NoParams());
    result.fold(
            (failure) => emit(state.copyWith(
            topRatedMoviesState: RequestState.error,
            topRatedMessage: failure.message)),
            (movies) => emit(state.copyWith(
            topRatedMoviesState: RequestState.loaded,
            topRatedMovies: movies)));
  }

  _searchMovies(FetchSearchMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await searchMovieUseCase(event.query);
    result.fold(
            (failure) => emit(state.copyWith(
            searchMoviesState: RequestState.error,
            searchMessage: failure.message)),
            (movies) => emit(state.copyWith(
            searchMoviesState: RequestState.loaded,
            searchMovies: movies)));
  }



}
