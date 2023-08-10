import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Gridclasswork(),
  ));
}

class Gridclasswork extends StatelessWidget {
  var icons = [
    Icons.home,
    Icons.alarm,
    Icons.camera,
    Icons.airplane_ticket,
    Icons.ac_unit,
    Icons.book_sharp,
    Icons.call,
    Icons.mail,
    Icons.sailing_outlined,
    Icons.insert_chart,
    Icons.mic_off,
    Icons.bookmark,
  ];

  var color = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.purple,
    Colors.teal,
    Colors.yellow,
    Colors.orangeAccent,
    Colors.pink,
    Colors.lightGreen,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage('assets/images/bghooliee.jpg'),
          fit: BoxFit.cover,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Grid View",
          style: GoogleFonts.satisfy(color: Colors.yellow[900], fontSize: 45),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 30,
                crossAxisCount: 2,
                mainAxisExtent: 70,
                crossAxisSpacing: 30),
            itemBuilder: (context, index) {
              return Container(
                height: 20,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(5, 5),
                      blurRadius: 20,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: color[index],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      icons[index],
                      size: 50,
                    ),
                    Text("Heart \n shaker")
                  ],
                ),
              );
            }),
      ),
    );
  }
}
