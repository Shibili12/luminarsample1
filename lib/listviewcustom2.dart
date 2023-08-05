import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Listviewcustom2(),
  ));
}

class Listviewcustom2 extends StatelessWidget {
  const Listviewcustom2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) => Center(
                  child: Column(
                    children: [
                      Text(
                        "item 1",
                        style: GoogleFonts.satisfy(fontSize: 30),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
