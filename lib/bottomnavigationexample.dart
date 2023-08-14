import 'package:flutter/material.dart';
import 'package:luminarsample1/gridview2.dart';
import 'package:luminarsample1/listview2.dart';
import 'package:luminarsample1/listviewbuilder.dart';
import 'package:luminarsample1/login_page.dart';

void main() {
  runApp(const MaterialApp(
    home: Bottomnavigation(),
  ));
}

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int index = 0;
  var screens = [
    Loginpage(),
    Listviewbuilder(),
    Listview2(),
    Gridview2(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.yellow,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: index,
          onTap: (tappedindex) {
            setState(() {
              index = tappedindex;
            });
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.yellow,
                icon: Icon(
                  Icons.home,
                ),
                label: "home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.search),
                label: "Serach"),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.account_circle),
                label: "profile"),
            BottomNavigationBarItem(
                backgroundColor: Colors.pink,
                icon: Icon(Icons.add_box_outlined),
                label: "create"),
          ]),
      body: screens[index],
    );
  }
}
