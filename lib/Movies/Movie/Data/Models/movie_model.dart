import '../../domain/entities/Movie.dart';

class MovieModel extends Movie{

  const MovieModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.genreIds,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.overview,
  });


  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      genreIds: List.from(json['genre_ids']).map((e) => e as int).toList(),
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      overview: json['overview'],
    );
  }


}