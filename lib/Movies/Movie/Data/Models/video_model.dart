import 'package:movies_app/Movies/Movie/domain/entities/video.dart';

class VideoModel extends Video{
  const VideoModel({
    required super.id,
    required super.key,
    required super.name,
    required super.site,
    required super.size,
    required super.type,
    
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      key: json['key'],
      name: json['name'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
    );
  }
}