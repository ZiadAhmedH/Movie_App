import 'package:freezed_annotation/freezed_annotation.dart';

part 'Series_Model.freezed.dart';
part 'Series_Model.g.dart';

@freezed
class Series with _$Series {
  const factory Series({
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    required int id,
    required String name,
    @JsonKey(name: 'original_name') String? originalName,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'original_language') String? originalLanguage,
    double? popularity,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
}
