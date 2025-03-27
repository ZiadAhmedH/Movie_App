import '../../domain/entities/tv.dart';

class TvModel extends Tv {

  const TvModel({
    required super.id,
    required super.name,
    required super.posterPath,
    required super.backdropPath,
    required super.firstAirDate,
    required super.genreIds,
    required super.voteAverage,
    required super.overview,
  }) ;


  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'] ?? " ",
      backdropPath: json['backdrop_path'] ?? " ",
      firstAirDate: json['first_air_date'] ?? " ",
      genreIds: List<int>.from(json['genre_ids']) ?? [],
      voteAverage: json['vote_average'].toDouble(),
      overview: json['overview'],
    );
  }

}