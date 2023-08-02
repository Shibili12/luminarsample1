import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("helloo welcome"),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.add),
        ],
      ),
    );
  }
}
