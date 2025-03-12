import 'package:equatable/equatable.dart';
import 'package:movies_app/Movies/Movie/domain/entities/generes.dart';

class MovieDetails  extends Equatable{
  final int? id;
  final String? backdropPath;
  final String? title;
  final String? overview;
  final String? releaseDate;
  final int? runtime;
  final int? voteAverage;
  final String? posterPath;
  final List<Genres>? genres;

  const MovieDetails( {
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.posterPath,
    required this.genres
  });

  @override
  List<Object?> get props => [id, backdropPath, title, overview, releaseDate,runtime ,voteAverage, posterPath , genres];

}