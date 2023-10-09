import 'package:flutter/material.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/firebase_db.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/login_fire.dart';

class Homefirebase extends StatelessWidget {
  const Homefirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Firebasehelper().logout();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Loginfirebase()));
          },
          child: Text("Sign out"),
        ),
      ),
    );
  }
}
