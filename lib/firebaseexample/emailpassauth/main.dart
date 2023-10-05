import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/home_fire.dart';
import 'package:luminarsample1/firebaseexample/emailpassauth/login_fire.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? Loginfirebase() : Homefirebase(),
  ));
}
