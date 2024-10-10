import 'package:freezed_annotation/freezed_annotation.dart';

part 'Series_Model.freezed.dart';
part 'Series_Model.g.dart';

@freezed
@freezed
class Series with _$Series {
  const factory Series({
    String? backdropPath,
    required int id,
    required String name,
    String? originalName,
    String? overview,
    String? posterPath,
    String? mediaType,
    String? originalLanguage,
    double? popularity,
    String? firstAirDate,
    double? voteAverage,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
}
