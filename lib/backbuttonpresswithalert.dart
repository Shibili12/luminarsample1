import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Backbuttonexitapp(),
  ));
}

class Backbuttonexitapp extends StatelessWidget {
  const Backbuttonexitapp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> showalert() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // backgroundColor: Colors.black,
              title: Text("Exit"),
              content: Text("do you really want to exit?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("yes")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("No")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("Cancel")),
              ],
            );
          });
    }

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("exitapp"),
        ),
      ),
      onWillPop: showalert,
    );
  }
}
