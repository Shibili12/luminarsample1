import 'package:flutter/material.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/firebase_db.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/login_fire.dart';

class Registerfirebase extends StatefulWidget {
  const Registerfirebase({super.key});

  @override
  State<Registerfirebase> createState() => _RegisterfirebaseState();
}

class _RegisterfirebaseState extends State<Registerfirebase> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "username",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "password",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String email = usernamecontroller.text.trim();
                String password = passwordcontroller.text.trim();
                Firebasehelper()
                    .register(email: email, password: password)
                    .then((result) {
                  if (result == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Loginfirebase()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              },
              child: const Text("resgister"),
            ),
          ],
        ),
      ),
    );
  }
}
