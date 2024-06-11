import 'package:hive/hive.dart';

part 'fuel_station.g.dart';

@HiveType(typeId: 0)
class FuelStation extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String location;

  @HiveField(2)
  double rating;

  FuelStation({
    required this.name,
    required this.location,
    required this.rating,
  });
}
