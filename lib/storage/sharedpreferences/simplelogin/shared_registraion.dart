import 'package:flutter/material.dart';
import 'package:luminarsample1/storage/sharedpreferences/simplelogin/shared_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sharedregistraion(),
    ),
  );
}

class Sharedregistraion extends StatefulWidget {
  const Sharedregistraion({super.key});

  @override
  State<Sharedregistraion> createState() => _SharedregistraionState();
}

class _SharedregistraionState extends State<Sharedregistraion> {
  TextEditingController name = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  late SharedPreferences preferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
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
                height: 10,
              ),
              TextField(
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
                height: 10,
              ),
              TextField(
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
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () async {
                  preferences = await SharedPreferences.getInstance();
                  String fullname = name.text;
                  String username = usercontroller.text;
                  String password = passwordcontroller.text;
                  if (fullname != "" && username != "" && password != "") {
                    preferences.setString("name", fullname);
                    preferences.setString("username", username);
                    preferences.setString("password", password);
                  }
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Sharedlogin())));
                },
                child: Text("Registraion"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
