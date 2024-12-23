import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failure.dart';
import '../entities/Movie.dart';
import '../repository/base_Movie_Repository.dart';

class FetchPlayingNowMovies {
  final BaseMovieRepository _movieRepository;

  FetchPlayingNowMovies(this._movieRepository);

  Future <Either<Failure , List<Movie>>> call() async {
    return await _movieRepository.fetchPlayingNowMovies();
  }
}