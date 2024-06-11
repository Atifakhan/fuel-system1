// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuel_system/admin_screens/fuel_model/fuel_stations.dart';
import 'package:fuel_system/home_screen.dart';

final nameProvider = StateProvider((ref) => "");
final addressProvider = StateProvider((ref) => "");
final contactProvider = StateProvider((ref) => "");
final valueProvider = StateProvider((ref) => "");

class GetReqScreen extends StatefulWidget {
  FuelStation note;
  GetReqScreen({required this.note});

  @override
  State<GetReqScreen> createState() => _GetReqScreenState();
}

class _GetReqScreenState extends State<GetReqScreen> {
  TextEditingController _getController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 300,
              child: Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        widget.note.name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                      Center(
                          child: Text(
                        widget.note.address,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                      Center(
                          child: Text(
                        widget.note.contact,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 100,
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: _getController,
              decoration: InputDecoration(
                // hintText: "Name",
                labelText: "Fuel",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              return MaterialButton(
                  child: Text("Get"),
                  color: Colors.lightBlue,
                  onPressed: () {
                    ref.read(nameProvider.notifier).state = widget.note.name;
                    ref.read(addressProvider.notifier).state =
                        widget.note.address;
                    ref.read(contactProvider.notifier).state =
                        widget.note.contact;
                    ref.read(valueProvider.notifier).state =
                        _getController.text;
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Text("Request Successfully")),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _getController.clear();
                                          },
                                          child: Text("Done"))
                                    ],
                                  ),
                                ),
                              ],
                            ));
                    setState(() {});
                  });
            },
          )
        ],
      ),
    );
  }
}
