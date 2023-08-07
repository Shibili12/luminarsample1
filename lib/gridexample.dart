import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Gridviewex(),
  ));
}

class Gridviewex extends StatelessWidget {
  const Gridviewex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Grid View",
          style: GoogleFonts.satisfy(color: Colors.yellow[900], fontSize: 45),
        ),
      ),
      body: GridView(
        children: List.generate(
            15,
            (index) => Card(
                  color: Colors.green,
                  child: Icon(Icons.home_outlined),
                )),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
