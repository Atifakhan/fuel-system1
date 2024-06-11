// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_station.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FuelStationAdapter extends TypeAdapter<FuelStation> {
  @override
  final int typeId = 0;

  @override
  FuelStation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FuelStation(
      name: fields[0] as String,
      location: fields[1] as String,
      rating: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FuelStation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FuelStationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
