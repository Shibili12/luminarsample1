import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statefulpage extends StatefulWidget {
  String name;

  String institute;

  int phone;

  Statefulpage({
    super.key,
    required this.name,
    required this.institute,
    required this.phone,
  });

  @override
  State<Statefulpage> createState() => _StatefulpageState();
}

class _StatefulpageState extends State<Statefulpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.institute,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "${widget.phone}",
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
