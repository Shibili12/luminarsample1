import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepagehive extends StatelessWidget {
  String? email;
  Homepagehive({
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
          child: Text(
        "Welcome $email",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
