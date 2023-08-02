import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luminarsample1/login_page.dart';
import 'package:luminarsample1/statefullogin.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 6),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login2(),
        ),
      ),
    );
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hooliesplash.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Image.asset(
              "assets/icons/iconhooliee.png",
              color: Colors.black,
            ),
            Text(
              "Hooolieeee!",
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w700,
                // fontStyle: FontStyle.italic,
                color: Colors.black,
                fontFamily: "hoolie",
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
