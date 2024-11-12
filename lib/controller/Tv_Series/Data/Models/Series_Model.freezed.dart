// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Series_Model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Series _$SeriesFromJson(Map<String, dynamic> json) {
  return _Series.fromJson(json);
}

/// @nodoc
mixin _$Series {
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String? get originalName => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String? get originalLanguage => throw _privateConstructorUsedError;
  double? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;

  /// Serializes this Series to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeriesCopyWith<Series> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesCopyWith<$Res> {
  factory $SeriesCopyWith(Series value, $Res Function(Series) then) =
      _$SeriesCopyWithImpl<$Res, Series>;
  @useResult
  $Res call(
      {@JsonKey(name: 'backdrop_path') String? backdropPath,
      int id,
      String name,
      @JsonKey(name: 'original_name') String? originalName,
      String? overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'media_type') String? mediaType,
      @JsonKey(name: 'original_language') String? originalLanguage,
      double? popularity,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class _$SeriesCopyWithImpl<$Res, $Val extends Series>
    implements $SeriesCopyWith<$Res> {
  _$SeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdropPath = freezed,
    Object? id = null,
    Object? name = null,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? mediaType = freezed,
    Object? originalLanguage = freezed,
    Object? popularity = freezed,
    Object? firstAirDate = freezed,
    Object? voteAverage = freezed,
  }) {
    return _then(_value.copyWith(
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesImplCopyWith<$Res> implements $SeriesCopyWith<$Res> {
  factory _$$SeriesImplCopyWith(
          _$SeriesImpl value, $Res Function(_$SeriesImpl) then) =
      __$$SeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'backdrop_path') String? backdropPath,
      int id,
      String name,
      @JsonKey(name: 'original_name') String? originalName,
      String? overview,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'media_type') String? mediaType,
      @JsonKey(name: 'original_language') String? originalLanguage,
      double? popularity,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      @JsonKey(name: 'vote_average') double? voteAverage});
}

/// @nodoc
class __$$SeriesImplCopyWithImpl<$Res>
    extends _$SeriesCopyWithImpl<$Res, _$SeriesImpl>
    implements _$$SeriesImplCopyWith<$Res> {
  __$$SeriesImplCopyWithImpl(
      _$SeriesImpl _value, $Res Function(_$SeriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backdropPath = freezed,
    Object? id = null,
    Object? name = null,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? mediaType = freezed,
    Object? originalLanguage = freezed,
    Object? popularity = freezed,
    Object? firstAirDate = freezed,
    Object? voteAverage = freezed,
  }) {
    return _then(_$SeriesImpl(
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriesImpl implements _Series {
  const _$SeriesImpl(
      {@JsonKey(name: 'backdrop_path') this.backdropPath,
      required this.id,
      required this.name,
      @JsonKey(name: 'original_name') this.originalName,
      this.overview,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'media_type') this.mediaType,
      @JsonKey(name: 'original_language') this.originalLanguage,
      this.popularity,
      @JsonKey(name: 'first_air_date') this.firstAirDate,
      @JsonKey(name: 'vote_average') this.voteAverage});

  factory _$SeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriesImplFromJson(json);

  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String? originalName;
  @override
  final String? overview;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  final double? popularity;
  @override
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @override
  String toString() {
    return 'Series(backdropPath: $backdropPath, id: $id, name: $name, originalName: $originalName, overview: $overview, posterPath: $posterPath, mediaType: $mediaType, originalLanguage: $originalLanguage, popularity: $popularity, firstAirDate: $firstAirDate, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesImpl &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      backdropPath,
      id,
      name,
      originalName,
      overview,
      posterPath,
      mediaType,
      originalLanguage,
      popularity,
      firstAirDate,
      voteAverage);

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesImplCopyWith<_$SeriesImpl> get copyWith =>
      __$$SeriesImplCopyWithImpl<_$SeriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriesImplToJson(
      this,
    );
  }
}

abstract class _Series implements Series {
  const factory _Series(
      {@JsonKey(name: 'backdrop_path') final String? backdropPath,
      required final int id,
      required final String name,
      @JsonKey(name: 'original_name') final String? originalName,
      final String? overview,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'media_type') final String? mediaType,
      @JsonKey(name: 'original_language') final String? originalLanguage,
      final double? popularity,
      @JsonKey(name: 'first_air_date') final String? firstAirDate,
      @JsonKey(name: 'vote_average') final double? voteAverage}) = _$SeriesImpl;

  factory _Series.fromJson(Map<String, dynamic> json) = _$SeriesImpl.fromJson;

  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String? get originalName;
  @override
  String? get overview;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  double? get popularity;
  @override
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeriesImplCopyWith<_$SeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
