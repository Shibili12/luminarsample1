import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Gridviewextend(),
  ));
}

class Gridviewextend extends StatelessWidget {
  const Gridviewextend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Grid View extend",
          style: GoogleFonts.satisfy(color: Colors.yellow[900], fontSize: 45),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.extent(
          maxCrossAxisExtent: 98,
          children: List.generate(
              15,
              (index) => Card(
                    color: Colors.green,
                    child: Icon(Icons.home_outlined),
                  )),
        ),
      ),
    );
  }
}
