import '../../domain/entities/cast_movie.dart';

class CastMovieModel extends Cast {
  const CastMovieModel(
      {required super.id, required super.name, required super.profilePath, required super.character});


  factory CastMovieModel.fromJson(Map<String, dynamic> json) {
    return CastMovieModel(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'],
    );
  }
}