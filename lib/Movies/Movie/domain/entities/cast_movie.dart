import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final int? id;
  final String? name;
  final String? profilePath;
  final String? character;

  const Cast({
    this.id,
    this.name,
    this.profilePath,
    this.character,
  });

  @override
  List<Object?> get props => [id, name, profilePath, character];
}