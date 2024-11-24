import 'package:freezed_annotation/freezed_annotation.dart';

part 'Series_Details_Model.freezed.dart';
part 'Series_Details_Model.g.dart';

@freezed
class SeriesDetails with _$SeriesDetails {
  const factory SeriesDetails({
    @JsonKey(name: 'adult') bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'first_air_date') String? firstAirDate,
    String? homepage,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'in_production') bool? inProduction,
    List<String>? languages,
    @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
    @JsonKey(name: 'original_name') String? originalName,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @Default(false) bool isFav,

  }) = _SeriesDetails;

  factory SeriesDetails.fromJson(Map<String, dynamic> json) => _$SeriesDetailsFromJson(json);
}
