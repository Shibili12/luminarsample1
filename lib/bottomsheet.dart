import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: Bottomsheetexample(),
  ));
}

class Bottomsheetexample extends StatelessWidget {
  const Bottomsheetexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => showsheet(context),
          child: Image.asset("assets/images/singer1.jpg"),
        ),
      ),
    );
  }

  void showsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.yellow,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20),
          // )),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Share to:",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  ),
                  title: Text("Whatsapp"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                  ),
                  title: Text("Instagram"),
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  title: Text("facebook"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
