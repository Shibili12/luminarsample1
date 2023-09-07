import 'package:flutter/material.dart';
import 'package:luminarsample1/storage/sharedpreferences/simplelogin/shared_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sharedlogin(),
    ),
  );
}

class Sharedlogin extends StatefulWidget {
  const Sharedlogin({super.key});

  @override
  State<Sharedlogin> createState() => _SharedloginState();
}

class _SharedloginState extends State<Sharedlogin> {
  //controller

  TextEditingController user = TextEditingController();
  TextEditingController pwd = TextEditingController();
  late bool newuser;

  //declare sharedprefrence cariable
  late SharedPreferences preferences;

  @override
  void initState() {
    check_user_already_login();
    super.initState();
  }

  void check_user_already_login() async {
    preferences = await SharedPreferences.getInstance();

    // ??---> null aware
    newuser = preferences.getBool("newuser") ?? true;

    if (newuser == false) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Sharedhome()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: user,
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
              TextFormField(
                controller: pwd,
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
                  //object of sharedpreference
                  preferences = await SharedPreferences.getInstance();

                  //to store datas to a variable from controller
                  String uname = user.text;
                  String pass = pwd.text;

                  if (uname != "" && pass != "") {
                    //to store data from variable to sharedpreference using object
                    preferences.setString("username", uname);
                    preferences.setString("password", pass);
                    //set the user login
                    preferences.setBool("newuser", false);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => Sharedhome()),
                      ),
                    );
                  }
                  //to clear texts in the textfield
                  user.text = "";
                  pwd.text = "";
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
