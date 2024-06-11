// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:fuel_system/admin_screens/fuel_model/fuel_stations.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  //var box = Hive.box<FuelStation>("SDB");

  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _addressEditingController = TextEditingController();
  TextEditingController _contactEditingController = TextEditingController();

  Future<void> _addstation() async {
    FuelStation station = FuelStation(
      name: _nameEditingController.text ?? "",
      address: _contactEditingController.text ?? "",
      contact: _addressEditingController.text ?? "",
    );
    await box.add(station);

    setState(() {});
  }

  late Box box = Hive.box("bb");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actions: [
                        SizedBox(
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Add Station"),
                              TextField(
                                controller: _nameEditingController,
                                decoration: InputDecoration(
                                  // hintText: "Name",
                                  labelText: "Name",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              TextField(
                                controller: _contactEditingController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: "Contact",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              TextField(
                                controller: _addressEditingController,
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  labelText: "Address",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  if (_nameEditingController.text.isEmpty ||
                                      _contactEditingController.text.isEmpty ||
                                      _addressEditingController.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Please Provide Complete Details"),
                                      backgroundColor: Colors.red,
                                    ));
                                  } else {
                                    print("Done");
                                    _addstation();
                                    _nameEditingController.clear();
                                    _contactEditingController.clear();
                                    _addressEditingController.clear();
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text("Add"),
                                color: Colors.green.shade200,
                              ),
                            ],
                          ),
                        )
                      ],
                    ));
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
                child: Card(
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "All Stations",
                  style: TextStyle(
                    fontSize: 20,
                    //color: Colors.white,
                  ),
                ),
              ),
            )),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, box, _) {
                  if (box.values.isEmpty) {
                    return Center(
                      child: Text('No notes yet.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      FuelStation note = box.getAt(index);
                      return Dismissible(
                        key: Key(note.name),
                        direction: DismissDirection.endToStart,
                        onDismissed: (dir) {
                          box.deleteAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("${note.name}-${note.address}")));
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor: Colors.amber.shade200,
                            leading: Icon(Icons.ev_station_rounded),
                            title: Text(note.name ?? ''),
                            subtitle: Text(note.contact ?? ''),
                            trailing: Text(note.address ?? ""),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _contactEditingController.dispose();
    _addressEditingController.dispose();
    super.dispose();
  }
}
