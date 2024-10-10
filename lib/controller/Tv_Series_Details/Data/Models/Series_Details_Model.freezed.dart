// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Series_Details_Model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeriesDetails _$SeriesDetailsFromJson(Map<String, dynamic> json) {
  return _SeriesDetails.fromJson(json);
}

/// @nodoc
mixin _$SeriesDetails {
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_production')
  bool? get inProduction => throw _privateConstructorUsedError;
  List<String>? get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_seasons')
  int? get numberOfSeasons => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String? get originalName => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  double? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriesDetailsCopyWith<SeriesDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesDetailsCopyWith<$Res> {
  factory $SeriesDetailsCopyWith(
          SeriesDetails value, $Res Function(SeriesDetails) then) =
      _$SeriesDetailsCopyWithImpl<$Res, SeriesDetails>;
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      String? homepage,
      int id,
      @JsonKey(name: 'in_production') bool? inProduction,
      List<String>? languages,
      @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
      @JsonKey(name: 'original_name') String? originalName,
      String? overview,
      double? popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount});
}

/// @nodoc
class _$SeriesDetailsCopyWithImpl<$Res, $Val extends SeriesDetails>
    implements $SeriesDetailsCopyWith<$Res> {
  _$SeriesDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? firstAirDate = freezed,
    Object? homepage = freezed,
    Object? id = null,
    Object? inProduction = freezed,
    Object? languages = freezed,
    Object? numberOfSeasons = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inProduction: freezed == inProduction
          ? _value.inProduction
          : inProduction // ignore: cast_nullable_to_non_nullable
              as bool?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      numberOfSeasons: freezed == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesDetailsImplCopyWith<$Res>
    implements $SeriesDetailsCopyWith<$Res> {
  factory _$$SeriesDetailsImplCopyWith(
          _$SeriesDetailsImpl value, $Res Function(_$SeriesDetailsImpl) then) =
      __$$SeriesDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'first_air_date') String? firstAirDate,
      String? homepage,
      int id,
      @JsonKey(name: 'in_production') bool? inProduction,
      List<String>? languages,
      @JsonKey(name: 'number_of_seasons') int? numberOfSeasons,
      @JsonKey(name: 'original_name') String? originalName,
      String? overview,
      double? popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'vote_average') double? voteAverage,
      @JsonKey(name: 'vote_count') int? voteCount});
}

/// @nodoc
class __$$SeriesDetailsImplCopyWithImpl<$Res>
    extends _$SeriesDetailsCopyWithImpl<$Res, _$SeriesDetailsImpl>
    implements _$$SeriesDetailsImplCopyWith<$Res> {
  __$$SeriesDetailsImplCopyWithImpl(
      _$SeriesDetailsImpl _value, $Res Function(_$SeriesDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? firstAirDate = freezed,
    Object? homepage = freezed,
    Object? id = null,
    Object? inProduction = freezed,
    Object? languages = freezed,
    Object? numberOfSeasons = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_$SeriesDetailsImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      inProduction: freezed == inProduction
          ? _value.inProduction
          : inProduction // ignore: cast_nullable_to_non_nullable
              as bool?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      numberOfSeasons: freezed == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriesDetailsImpl implements _SeriesDetails {
  const _$SeriesDetailsImpl(
      {required this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'first_air_date') this.firstAirDate,
      this.homepage,
      required this.id,
      @JsonKey(name: 'in_production') this.inProduction,
      final List<String>? languages,
      @JsonKey(name: 'number_of_seasons') this.numberOfSeasons,
      @JsonKey(name: 'original_name') this.originalName,
      this.overview,
      this.popularity,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount})
      : _languages = languages;

  factory _$SeriesDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriesDetailsImplFromJson(json);

  @override
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;
  @override
  final String? homepage;
  @override
  final int id;
  @override
  @JsonKey(name: 'in_production')
  final bool? inProduction;
  final List<String>? _languages;
  @override
  List<String>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'number_of_seasons')
  final int? numberOfSeasons;
  @override
  @JsonKey(name: 'original_name')
  final String? originalName;
  @override
  final String? overview;
  @override
  final double? popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  @override
  String toString() {
    return 'SeriesDetails(adult: $adult, backdropPath: $backdropPath, firstAirDate: $firstAirDate, homepage: $homepage, id: $id, inProduction: $inProduction, languages: $languages, numberOfSeasons: $numberOfSeasons, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesDetailsImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inProduction, inProduction) ||
                other.inProduction == inProduction) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.numberOfSeasons, numberOfSeasons) ||
                other.numberOfSeasons == numberOfSeasons) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      backdropPath,
      firstAirDate,
      homepage,
      id,
      inProduction,
      const DeepCollectionEquality().hash(_languages),
      numberOfSeasons,
      originalName,
      overview,
      popularity,
      posterPath,
      voteAverage,
      voteCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesDetailsImplCopyWith<_$SeriesDetailsImpl> get copyWith =>
      __$$SeriesDetailsImplCopyWithImpl<_$SeriesDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriesDetailsImplToJson(
      this,
    );
  }
}

abstract class _SeriesDetails implements SeriesDetails {
  const factory _SeriesDetails(
      {required final bool adult,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'first_air_date') final String? firstAirDate,
      final String? homepage,
      required final int id,
      @JsonKey(name: 'in_production') final bool? inProduction,
      final List<String>? languages,
      @JsonKey(name: 'number_of_seasons') final int? numberOfSeasons,
      @JsonKey(name: 'original_name') final String? originalName,
      final String? overview,
      final double? popularity,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount}) = _$SeriesDetailsImpl;

  factory _SeriesDetails.fromJson(Map<String, dynamic> json) =
      _$SeriesDetailsImpl.fromJson;

  @override
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'first_air_date')
  String? get firstAirDate;
  @override
  String? get homepage;
  @override
  int get id;
  @override
  @JsonKey(name: 'in_production')
  bool? get inProduction;
  @override
  List<String>? get languages;
  @override
  @JsonKey(name: 'number_of_seasons')
  int? get numberOfSeasons;
  @override
  @JsonKey(name: 'original_name')
  String? get originalName;
  @override
  String? get overview;
  @override
  double? get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$SeriesDetailsImplCopyWith<_$SeriesDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
