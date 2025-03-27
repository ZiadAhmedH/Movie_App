import 'package:equatable/equatable.dart';

class Tv extends Equatable{

  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;
  final String? firstAirDate;
  final List<int>? genreIds;
  final double? voteAverage;
  final String? overview;

  const Tv({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
    this.genreIds,
    this.firstAirDate,
    this.voteAverage,
    this.overview,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    posterPath ?? " ",
    backdropPath,
    firstAirDate,
    genreIds,
    voteAverage,
    overview,
  ];
}