import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Expandedexample(),
  ));
}

class Expandedexample extends StatelessWidget {
  const Expandedexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(child: Image.asset("assets/images/mini2.jpg")),
            Expanded(child: Image.asset("assets/images/hooliesplash.jpg")),
            Expanded(child: Image.asset("assets/images/bghooliee.jpg")),
          ],
        ));
  }
}
