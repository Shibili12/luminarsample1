import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luminarsample1/storage/sqflite_crud/loginregistration/loginpage.dart';
import 'package:luminarsample1/storage/sqflite_crud/loginregistration/registrationpage.dart';

void main() {
  runApp(MaterialApp(
    home: Welcomepage(),
  ));
}

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "Welcome......!",
              style: GoogleFonts.nunito(
                color: Colors.green[900],
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset("assets/images/robot.png"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => Loginpagesqf())));
              },
              child: Text("login"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => Registrationpage())));
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
