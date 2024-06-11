// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_stations.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FuelStationAdapter extends TypeAdapter<FuelStation> {
  @override
  final int typeId = 1;

  @override
  FuelStation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FuelStation(
      name: fields[0] as String,
      address: fields[1] as String,
      contact: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FuelStation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.contact);
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
