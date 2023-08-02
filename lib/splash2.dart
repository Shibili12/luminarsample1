import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash2(),
    ),
  );
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Colors.yellow,
          //     Colors.green,
          //   ],
          // ),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bghooliee.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/iconhooliee.png",
                height: 150,
                width: 300,
                color: Colors.white,
              ),
              Text(
                "Hooolieeee!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  // fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
