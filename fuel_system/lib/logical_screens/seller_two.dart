import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuel_system/logical_screens/fuel_station_provider.dart';

import 'fuel_station.dart';

class Seller2Screen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stations = ref.watch(fuelStationProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Fuel Stations Ratings')),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final station = stations[index];
          return ListTile(
            title: Text(station.name),
            subtitle: Text(station.location),
            trailing: Text(station.rating.toString()),
          );
        },
      ),
    );
  }
}
