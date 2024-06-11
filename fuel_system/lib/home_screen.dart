// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_system/admin_screens/fuel_model/fuel_stations.dart';
import 'package:fuel_system/get_req_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box box = Hive.box("bb");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            GestureDetector(
              onTap: () {
                //  Navigator.pushNamed(context, '/');
              },
              child: SizedBox(
                child: Image.asset(
                  "assets/images/main_widget.png",
                ),
              ),
            ),
            //SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Chose Your Fuel Type",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/stl');
                  },
                  child: SvgPicture.asset('assets/images/petrol.svg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/stl');
                  },
                  child: SvgPicture.asset('assets/images/diesel.svg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/stl');
                  },
                  child: SvgPicture.asset('assets/images/gas.svg'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Near by Fuel Station",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Image.asset(
            //   "assets/images/pump.png",
            //   width: 120,
            //   height: 120,
            // ),
            SizedBox(
              height: 500,
              child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box box, _) {
                  if (box.values.isEmpty) {
                    return Center(
                      child: Text('No notes yet.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      FuelStation note = box.getAt(index);
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetReqScreen(
                                        note: note,
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
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
                                  height: 100,
                                ),
                              ),
                              Positioned(
                                left: 120,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${note.name}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Positioned(
                                top: 38,
                                left: 115,
                                child: Row(children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    note.address,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 5),
                              Positioned(
                                top: 67,
                                left: 115,
                                child: Row(children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                  Text(
                                    note.contact,
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

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
