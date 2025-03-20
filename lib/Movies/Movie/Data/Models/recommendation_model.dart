import 'package:movies_app/Movies/Movie/domain/entities/recommendation_movie.dart';

class RecommendationMovieModel extends Recommendation {
  const RecommendationMovieModel(
      {required super.id, required super.title,  super.backdropPath ,  super.posterPath});


  RecommendationMovieModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          title: json['title'],
          backdropPath: json['backdrop_path'] ?? 'https://www.google.com.eg/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fopps&psig=AOvVaw1s8TKGKHuJ87K2KyT86Zhu&ust=1741979373217000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPiY97zhh4wDFQAAAAAdAAAAABAE',
          posterPath: json['poster_path'] ,
        );
}
