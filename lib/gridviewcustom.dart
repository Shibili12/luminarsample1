import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Gridcustom(),
  ));
}

class Gridcustom extends StatelessWidget {
  const Gridcustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Grid View custom",
          style: GoogleFonts.satisfy(color: Colors.yellow[900], fontSize: 45),
        ),
      ),
      body: GridView.custom(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        childrenDelegate: SliverChildListDelegate(
          List.generate(
              12,
              (index) => Center(
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/mini2.jpg"),
                              )),
                        ),
                        Text("item1"),
                        Text("\$299"),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
