import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luminarsample1/firebaseexample/phoneauthentication/login.dart';

class Homephoneauth extends StatefulWidget {
  const Homephoneauth({super.key});

  @override
  State<Homephoneauth> createState() => _HomephoneauthState();
}

class _HomephoneauthState extends State<Homephoneauth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "hyy welcome",
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loginphoneauth(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
