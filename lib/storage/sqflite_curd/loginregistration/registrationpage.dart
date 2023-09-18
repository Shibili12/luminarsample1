import 'package:flutter/material.dart';

import 'package:luminarsample1/storage/sqflite_curd/loginregistration/loginpage.dart';
import 'package:luminarsample1/storage/sqflite_curd/loginregistration/sqlhelper.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  final namecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter Name",
                  filled: true,
                  fillColor: Colors.amber[200],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: usernamecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter username",
                  filled: true,
                  fillColor: Colors.amber[200],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter password",
                  filled: true,
                  fillColor: Colors.amber[200],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () async {
                  if (namecontroller.text != "" &&
                      usernamecontroller.text != "" &&
                      passwordcontroller.text != "") {
                    await createUser(namecontroller.text,
                        usernamecontroller.text, passwordcontroller.text);
                  }
                },
                child: Text("Sign up"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Loginpagesqf())));
                      },
                      child: Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createUser(String name, String username, String password) async {
    final id = await Sqlhelper2.create_user(name, username, password);
    print(id);
    if (id != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Loginpagesqf()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("enter correct details")));
    }
  }
}
