import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Listviewcustom(),
  ));
}

class Listviewcustom extends StatelessWidget {
  const Listviewcustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildListDelegate(List.generate(
            10,
            (index) => Card(
                  child: Text(
                    "tudo passa",
                    style: GoogleFonts.satisfy(fontSize: 30),
                  ),
                ))),
      ),
    );
  }
}
