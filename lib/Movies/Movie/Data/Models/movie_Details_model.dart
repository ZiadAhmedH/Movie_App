import 'package:movies_app/Movies/Movie/domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.backdropPath,
      required super.title,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.voteAverage,
      required super.posterPath,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      voteAverage: json['vote_average'],
      posterPath: json['poster_path'],
      genres: List<GenresModel>.from(json['genres']
          .map((genre) => GenresModel.fromJson(genre)),)
    );
  }
}
