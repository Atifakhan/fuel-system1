// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuel_system/auth_services.dart';
import 'package:fuel_system/home_screen.dart';

class RegisterationScreen extends StatefulWidget {
  RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final AuthService _authService = AuthService();
  bool isLoad = true;
  Future<void> _signInWithGoogle() async {
    final User? user = await _authService.signInWithGoogle();
    if (user != null) {
      HomeScreen();
      print("SIGNEd");
      // Navigator.pushReplacementNamed(context, "/home");
      // User is signed in, handle the user data.
    } else {
      // An error occurred during sign in, handle the error.
      print("Didn't Success");
    }
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // User? _user;
  // @override
  // void initState() {
  //   super.initState();
  //   _auth.authStateChanges().listen((event) {
  //     setState(() {
  //       _user = event;
  //     });
  //   });
  // }

  // void _handleGoogleSignIn() {
  //   try {
  //     GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
  //     _auth.signInWithProvider(_googleAuthProvider);
  //   } catch (e) {}
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/id_screen.svg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 530,
              left: 55,
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                        _signInWithGoogle();
                        setState(() {});
                      },
                      child: Text("Sign in"),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // SizedBox(
                  //   width: 300,
                  //   height: 40,
                  //   child: MaterialButton(
                  //     onPressed: () {
                  //       setState(() {});
                  //       _signInWithGoogle();
                  //     },
                  //     child: Text("Register"),
                  //     color: Colors.white,
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      _signInWithGoogle();
                      Navigator.pushReplacementNamed(context, "/adminst");
                      setState(() {});
                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        // border: Border.all(width: 0.2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            spreadRadius: 0.2,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffFF6A6A),
                            Color(0xffEE3232),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            "Register as Seller",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 60,
              left: 100,
              child: Text(
                "Fuel Anytimes",
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 2,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
