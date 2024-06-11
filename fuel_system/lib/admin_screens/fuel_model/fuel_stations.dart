import 'package:hive_flutter/hive_flutter.dart';

part 'fuel_stations.g.dart';

@HiveType(typeId: 1)
class FuelStation {
  @HiveField(0)
  String name;
  @HiveField(1)
  String address;
  @HiveField(2)
  String contact;

  FuelStation(
      {required this.name, required this.address, required this.contact});
}
