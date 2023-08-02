import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:luminarsample1/home.dart';

class Loginpage extends StatelessWidget {
  // const Loginpage({super.key});
  String Username = "shibili";
  String password = "12345";
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordconroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      // appBar: AppBar(
      //   title: Center(
      //     child: Text(
      //       "login",
      //       style: TextStyle(
      //         color: Colors.black,
      //         fontSize: 25,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Colors.yellow,
      //   elevation: 0,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernamecontroller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 3),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 3),
                  ),
                  hintText: "Enter username",
                  prefixIcon: Icon(Icons.person_outlined),
                  labelText: "username"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordconroller,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 3),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 3),
                  ),
                  hintText: "enter password",
                  prefixIcon: Icon(Icons.key),
                  labelText: "password"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(100, 40),
              ),
              onPressed: () {
                if (Username == usernamecontroller.text &&
                    password == passwordconroller.text) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => Home())),
                  );
                } else {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text("invalid password or username"),
                  //     backgroundColor: Colors.red,
                  //   ),
                  // );
                  Fluttertoast.showToast(
                      msg: "invalid username and password",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
