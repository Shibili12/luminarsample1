import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Refractoring3(),
  ));
}

class Refractoring3 extends StatelessWidget {
  const Refractoring3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return MyRefractoringwidget(
            bgcolor: Colors.pink[50],
            label: Text(
              "Hayyy",
              style: GoogleFonts.moonDance(
                  fontWeight: FontWeight.bold, fontSize: 30),
            ),
            image: Image.asset(
              "assets/images/hooliesplash.jpg",
            ),
            icon: Icon(
              Icons.person_2_outlined,
            ),
          );
        },
      ),
    );
  }
}

class MyRefractoringwidget extends StatelessWidget {
  final Color? bgcolor;
  final Image? image;
  VoidCallback? onClick;
  Widget? label;
  Widget? icon;
  MyRefractoringwidget({
    this.bgcolor,
    required this.image,
    this.label,
    this.onClick,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgcolor,
      child: ListTile(
        leading: image,
        title: label,
        onTap: onClick,
        trailing: icon,
      ),
    );
  }
}
