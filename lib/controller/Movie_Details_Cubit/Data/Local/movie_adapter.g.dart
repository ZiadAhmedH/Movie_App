// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMovieAdapter extends TypeAdapter<HiveMovie> {
  @override
  final int typeId = 0;

  @override
  HiveMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMovie(
      id: fields[0] as int,
      title: fields[1] as String,
      overview: fields[2] as String,
    ).._isFav = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, HiveMovie obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj._isFav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
