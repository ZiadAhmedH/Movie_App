import 'package:freezed_annotation/freezed_annotation.dart';

part 'Movie_Model.freezed.dart';
part 'Movie_Model.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'overview') String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
