import 'package:flutter/material.dart';
import 'package:luminarsample1/storage/sharedpreferences/simplelogin/shared_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedhome extends StatefulWidget {
  const Sharedhome({super.key});

  @override
  State<Sharedhome> createState() => _SharedhomeState();
}

class _SharedhomeState extends State<Sharedhome> {
  late SharedPreferences preferences;
  late String username;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome $username"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  preferences.setBool("newuser", true);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: ((context) => Sharedlogin())));
                },
                child: Text("logout"))
          ],
        ),
      ),
    );
  }
}
