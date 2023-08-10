import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Stackexample(),
  ));
}

class Stackexample extends StatelessWidget {
  const Stackexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.teal,
              ),
              height: 300,
              width: 400,
            ),
          ),
          Positioned(
            top: 330,
            left: 50,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/chip.png",
                  height: 100,
                  width: 100,
                ),
                Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Icon(
                    Icons.wifi,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 450,
            right: 20,
            child: Image.asset(
              "assets/images/visa.png",
              height: 100,
              width: 100,
            ),
          ),
          Positioned(
            top: 480,
            left: 40,
            child: Text(
              "Arthur Dent",
              style: GoogleFonts.nunitoSans(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: 270,
            right: 30,
            child: Text(
              "fi",
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
