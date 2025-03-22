import 'package:hive/hive.dart';

part 'fav_movie_model.g.dart';

@HiveType(typeId: 0)
class FavoriteMovieModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  FavoriteMovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory FavoriteMovieModel.fromJson(Map<String, dynamic> json) {
    return FavoriteMovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
    );
  }
}
