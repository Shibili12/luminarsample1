import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Gridview2(),
  ));
}

class Gridview2 extends StatelessWidget {
  const Gridview2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Grid View builder",
          style: GoogleFonts.satisfy(color: Colors.yellow[900], fontSize: 45),
        ),
      ),
      body: GridView.builder(
        itemCount: 23,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: ((context, index) {
          return Card(
            color: Colors.green,
            child: Icon(Icons.home_outlined),
          );
        }),
      ),
    );
  }
}
