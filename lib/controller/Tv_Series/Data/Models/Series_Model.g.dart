// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Series_Model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriesImpl _$$SeriesImplFromJson(Map<String, dynamic> json) => _$SeriesImpl(
      backdropPath: json['backdropPath'] as String?,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      originalName: json['originalName'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      mediaType: json['mediaType'] as String?,
      originalLanguage: json['originalLanguage'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      firstAirDate: json['firstAirDate'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SeriesImplToJson(_$SeriesImpl instance) =>
    <String, dynamic>{
      'backdropPath': instance.backdropPath,
      'id': instance.id,
      'name': instance.name,
      'originalName': instance.originalName,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'mediaType': instance.mediaType,
      'originalLanguage': instance.originalLanguage,
      'popularity': instance.popularity,
      'firstAirDate': instance.firstAirDate,
      'voteAverage': instance.voteAverage,
    };
