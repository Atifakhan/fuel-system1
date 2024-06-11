// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/reg");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/splash.svg',
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 70,
              left: 150,
              child: Text(
                "Fuel",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 105,
              left: 120,
              child: Text(
                "Anytime",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 490,
              left: 80,
              child: Text(
                "Get Fuel Whenever you need",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 251, 251),
                  //  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 650,
              left: 150,
              child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/reg'),
                  child: MyBtn()),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBtn extends StatelessWidget {
  const MyBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            Color(0xffFF6A6A),
            Color(0xffEE3232),
          ],
        ),
      ),
      child: Text(
        "GET",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,

          //  fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
