import 'package:flutter/material.dart';
import 'package:luminarsample1/passing_data_between_screen%20/usingconstructor/to_statefulpage.dart';
import 'package:luminarsample1/passing_data_between_screen%20/usingconstructor/to_statelesspage.dart';

void main() {
  runApp(MaterialApp(
    home: Datapage(),
  ));
}

class Datapage extends StatelessWidget {
  const Datapage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => Statelesspage(
                            name: "luminar Technolab",
                            location: "kakkanad",
                            phone: 8989796912,
                          ))));
                },
                child: Text("to stateless page")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Statefulpage(
                            name: "shibili",
                            institute: "luminar technolab",
                            phone: 8848555711,
                          )));
                },
                child: Text("to stateful page")),
          ],
        ),
      ),
    );
  }
}
