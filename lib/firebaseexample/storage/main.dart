import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luminarsample1/firebaseexample/storage/firebasestorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyA3EftWSKn5kBJGZlQkabD5LpPKwoQhTNM",
    appId: "1:604745732119:android:b60570c6749a79b3128c52",
    messagingSenderId: "",
    projectId: "newproject1-ab48d",
    storageBucket: "newproject1-ab48d.appspot.com",
  ));
  runApp(
    MaterialApp(
      home: Firestorage(),
    ),
  );
}
