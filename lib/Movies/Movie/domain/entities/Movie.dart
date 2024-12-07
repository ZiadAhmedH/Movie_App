import 'package:equatable/equatable.dart';


class Movie extends Equatable {
  final int? id;
  final String? title;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final List<int>? genreIds;
  final double? voteAverage;
  final String? overview;

  const Movie({
    this.id,
    this.title,
    this.posterPath,
    this.backdropPath,
    this.genreIds,
    this.releaseDate,
    this.voteAverage,
    this.overview,
  });

  @override
  List<Object?> get props =>
      [
        id,
        title,
        posterPath,
        backdropPath,
        releaseDate,
        genreIds,
        voteAverage,
        overview,
      ];


}