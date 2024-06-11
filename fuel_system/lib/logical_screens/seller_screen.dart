// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuel_system/logical_screens/fuel_station_provider.dart';
import 'fuel_station.dart';

class SellerScreen extends ConsumerWidget {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _ratingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Fuel Station')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name')),
            TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location')),
            TextField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating')),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final location = _locationController.text;
                final rating = double.tryParse(_ratingController.text) ?? 0.0;

                final station = FuelStation(
                  name: name,
                  location: location,
                  rating: rating,
                );
                ref.read(fuelStationProvider.notifier).addStation(station);

                _nameController.clear();
                _locationController.clear();
                _ratingController.clear();
              },
              child: Text('Add Station'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/buyer');
              },
              child: Text('Go to Buyer Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
