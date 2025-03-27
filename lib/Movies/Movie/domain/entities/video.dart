import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? publishedAt;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? id;

  const Video({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.publishedAt,
    this.site,
    this.size,
    this.type,
    this.official,
    this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      iso6391: json["iso_639_1"] as String?,
      iso31661: json["iso_3166_1"] as String?,
      name: json["name"] as String?,
      key: json["key"] as String?,
      publishedAt: json["published_at"] as String?,
      site: json["site"] as String?,
      size: json["size"] as int?,
      type: json["type"] as String?,
      official: json["official"] as bool?,
      id: json["id"] as String?,
    );
  }

  @override
  List<Object?> get props => [
    iso6391,
    iso31661,
    name,
    key,
    publishedAt,
    site,
    size,
    type,
    official,
    id,
  ];
}
