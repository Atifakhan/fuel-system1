// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fuel_system/admin_screens/fuel_model/fuel_stations.dart';
import 'package:fuel_system/get_req_screen.dart';
import 'package:fuel_system/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StationsList extends StatefulWidget {
  StationsList({super.key});

  @override
  State<StationsList> createState() => _StationsListState();
}

class _StationsListState extends State<StationsList> {
  late Box box = Hive.box("bb");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "All Stations",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 40),
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
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetReqScreen(
                                          note: note,
                                        )));
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                color: const Color.fromARGB(255, 240, 240, 240),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                child: Image.asset(
                                  "assets/images/pump.png",
                                  fit: BoxFit.cover,
                                  width: 110,
                                  height: 120,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 120,
                                child: Row(
                                  children: [
                                    Text(
                                      note.name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 85,
                                left: 120,
                                child: Row(children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    note.contact,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                              ),
                              Positioned(
                                top: 35,
                                left: 120,
                                child: Row(children: [
                                  Text(
                                    "4.0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star_half_rounded,
                                    color: Colors.amber,
                                  )
                                ]),
                              ),
                              Positioned(
                                top: 60,
                                left: 115,
                                child: Row(children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                  Text(
                                    note.address,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      //fontSize: 14,
                                      //  fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
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
}
