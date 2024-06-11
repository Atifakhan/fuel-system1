// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuel_system/admin_screens/admin_home.dart';
import 'package:fuel_system/admin_screens/fuel_model/fuel_stations.dart';
import 'package:fuel_system/firebase_options.dart';
import 'package:fuel_system/get_req_screen.dart';
import 'package:fuel_system/home_screen.dart';
import 'package:fuel_system/id_screen.dart';
import 'package:fuel_system/splash_screen.dart';
import 'package:fuel_system/stations_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FuelStationAdapter());
  await Hive.openBox("bb");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //       apiKey: 'AIzaSyCLxBj3tFyBwyPMdXrYbbK6y03Taht-9Rk',
  //       appId: '1:639155497916:android:8c5161f11c510943a9d9b9',
  //       messagingSenderId: '639155497916',
  //       projectId: 'fuelbox-86009'),
  // );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONLINE FUEL PICKUP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        //'/': (context) => MainScreen(),
        '/': (context) => SplashScreen(),
        '/reg': (context) => RegisterationScreen(),
        '/home': (context) => HomeScreen(),
        '/stl': (context) => StationsList(),
        '/adminst': (context) => AdminHomeScreen(),
      },
    );
  }
}
