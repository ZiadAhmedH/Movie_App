// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Series_Details_Model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriesDetailsImpl _$$SeriesDetailsImplFromJson(Map<String, dynamic> json) =>
    _$SeriesDetailsImpl(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      homepage: json['homepage'] as String?,
      id: (json['id'] as num?)?.toInt(),
      inProduction: json['in_production'] as bool?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt(),
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      isFav: json['isFav'] as bool? ?? false,
    );

Map<String, dynamic> _$$SeriesDetailsImplToJson(_$SeriesDetailsImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate,
      'homepage': instance.homepage,
      'id': instance.id,
      'in_production': instance.inProduction,
      'languages': instance.languages,
      'number_of_seasons': instance.numberOfSeasons,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'isFav': instance.isFav,
    };
