import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuel_system/logical_screens/fuel_station_provider.dart';
import 'fuel_station.dart';

class BuyerScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stations = ref.watch(fuelStationProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Fuel Stations')),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final station = stations[index];
          return ListTile(
            title: Text(station.name),
            subtitle: Text(station.location),
            trailing: Text(station.rating.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StationDetailScreen(station: station, index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StationDetailScreen extends ConsumerWidget {
  final FuelStation station;
  final int index;

  StationDetailScreen({required this.station, required this.index});

  final _ratingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(station.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Location: ${station.location}'),
            Text('Rating: ${station.rating}'),
            TextField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'New Rating')),
            ElevatedButton(
              onPressed: () {
                final newRating =
                    double.tryParse(_ratingController.text) ?? station.rating;
                ref
                    .read(fuelStationProvider.notifier)
                    .updateRating(index, newRating);
                Navigator.pop(context);
              },
              child: Text('Update Rating'),
            ),
          ],
        ),
      ),
    );
  }
}
