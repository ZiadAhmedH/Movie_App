import 'package:equatable/equatable.dart';

class Recommendation extends Equatable{
  final int id;
  final String title;
  final String? backdropPath;

 const Recommendation({
    required this.id,
    required this.title,
     this.backdropPath,
  });

  @override
  List<Object?> get props => [id, title, backdropPath];
}