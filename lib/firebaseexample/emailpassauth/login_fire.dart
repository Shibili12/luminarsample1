import 'package:flutter/material.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/firebase_db.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/home_fire.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/register_fire.dart';

class Loginfirebase extends StatefulWidget {
  const Loginfirebase({super.key});

  @override
  State<Loginfirebase> createState() => _LoginfirebaseState();
}

class _LoginfirebaseState extends State<Loginfirebase> {
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
                    .login(email: email, password: password)
                    .then((result) {
                  if (result == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homefirebase()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              },
              child: const Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Registerfirebase()));
                },
                child: Text("register here"))
          ],
        ),
      ),
    );
  }
}
