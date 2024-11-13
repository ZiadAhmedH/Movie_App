import 'package:freezed_annotation/freezed_annotation.dart';


part 'Movie_Deatails_Model.freezed.dart';
part 'Movie_Deatails_Model.g.dart';

@freezed
class MovieDetails with _$MovieDetails{
  const factory MovieDetails({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    int? budget,
    String? homepage,
    int? id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    int? revenue,
    int? runtime,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @Default(false) bool isFav,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
}
