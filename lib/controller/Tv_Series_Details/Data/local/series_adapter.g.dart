// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSeriesAdapter extends TypeAdapter<HiveSeries> {
  @override
  final int typeId = 0;

  @override
  HiveSeries read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSeries(
      id: fields[0] as int,
      title: fields[1] as String,
      overview: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSeries obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSeriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}