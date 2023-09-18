import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luminarsample1/mediaquery/home.dart';
import 'package:luminarsample1/storage/sqflite_curd/loginregistration/adminpage.dart';
import 'package:luminarsample1/storage/sqflite_curd/loginregistration/homepage.dart';
import 'package:luminarsample1/storage/sqflite_curd/loginregistration/registrationpage.dart';
import 'package:luminarsample1/storage/sqflite_curd/loginregistration/sqlhelper.dart';

class Loginpagesqf extends StatefulWidget {
  const Loginpagesqf({super.key});

  @override
  State<Loginpagesqf> createState() => _LoginpagesqfState();
}

class _LoginpagesqfState extends State<Loginpagesqf> {
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();
  String admin = "admin";
  String adminpassword = "admin";

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
                controller: usercontroller,
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
                controller: passcontroller,
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
                onPressed: () {
                  if (usercontroller.text == admin &&
                      passcontroller.text == adminpassword) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => Adminpage())));
                  } else {
                    logincheck(usercontroller.text, passcontroller.text);
                  }
                },
                child: Text("login"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Registrationpage())));
                      },
                      child: Text("sign up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void logincheck(String username, String password) async {
    var data = await Sqlhelper2.checklogin(username, password);

    if (data.isNotEmpty) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => Homepagesqf())));
      print("login success");
    } else if (data.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Loginfailed")));
    }
  }
}
