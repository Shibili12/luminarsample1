import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Listviewbuilder(),
  ));
}

class Listviewbuilder extends StatelessWidget {
  const Listviewbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Card(
              shape: CircleBorder(),
              color: Colors.yellow,
              child: Image.asset(
                "assets/icons/iconhooliee.png",
              ),
            );
          })),
    );
  }
}
