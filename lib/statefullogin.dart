import 'package:flutter/material.dart';
import 'package:luminarsample1/home.dart';
import 'package:luminarsample1/registration.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  var formkey = GlobalKey<FormState>();
  bool nopasswordvisiblity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/hooliesplash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                ),
                Text(
                  "Hi Welcome",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "heading",
                    // shadows: [
                    //   Shadow(
                    //       color: Colors.black,
                    //       offset: Offset(3, 5),
                    //       blurRadius: 50),
                    // ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (username) {
                    if (username!.isEmpty || !username.contains("@")) {
                      return "field is empty/invalid";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "enter username",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: nopasswordvisiblity,
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "password is incorrect";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "enter password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (nopasswordvisiblity == true) {
                            nopasswordvisiblity = false;
                          } else {
                            nopasswordvisiblity = true;
                          }
                        });
                      },
                      icon: Icon(nopasswordvisiblity == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(100, 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {
                    final valid = formkey.currentState!.validate();
                    if (valid) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("invalid password or username"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text("login"),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Registraion()),
                      );
                    },
                    child: Text(
                      "not a user?Register here",
                      style: TextStyle(
                        fontFamily: "hoolie",
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
