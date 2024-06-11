import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'fuel_station.dart';

final fuelStationProvider =
    StateNotifierProvider<FuelStationNotifier, List<FuelStation>>((ref) {
  return FuelStationNotifier();
});

class FuelStationNotifier extends StateNotifier<List<FuelStation>> {
  FuelStationNotifier() : super([]) {
    _loadStations();
  }

  void _loadStations() async {
    final box = Hive.box<FuelStation>('fuelStations');
    state = box.values.toList();
  }

  void addStation(FuelStation station) async {
    final box = Hive.box<FuelStation>('fuelStations');
    await box.add(station);
    state = box.values.toList();
  }

  void updateRating(int index, double rating) async {
    final box = Hive.box<FuelStation>('fuelStations');
    final station = box.getAt(index);
    if (station != null) {
      station.rating = rating;
      await station.save();
      state = box.values.toList();
    }
  }
}
