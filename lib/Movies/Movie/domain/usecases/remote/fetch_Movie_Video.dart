import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/Core/usecase/base_Use_Case.dart';
import 'package:movies_app/Movies/Movie/domain/entities/video.dart';

import '../../../../../Core/errors/failure.dart';
import '../../repository/base_Movie_Repository.dart';

class FetchMovieVideo extends BaseUseCase<Video,MovieVideoParams> {
  final BaseMovieRepository _repository;

  FetchMovieVideo(this._repository);
  @override
  Future<Either<Failure, Video>> call(MovieVideoParams params) async {
    return await _repository.fetchMovieVideo(params);
  }
}

class MovieVideoParams extends Equatable {
  final int id;

  const MovieVideoParams(this.id);

  @override
  List<Object?> get props => [id];
}