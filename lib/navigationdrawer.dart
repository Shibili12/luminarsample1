import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Drawerexample(),
  ));
}

class Drawerexample extends StatelessWidget {
  const Drawerexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww&auto=format&fit=crop&w=700&q=60"))),
              accountName: Text(
                "Mohammed Shibili",
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              accountEmail: Text(
                "shibili@gmail.com",
                style: GoogleFonts.nunito(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1531831108325-7fe9616bc780?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z2VudGxlbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=700&q=60"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1620122830785-a18b43585b44?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fGdlbnRsZW1hbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60"),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1508835277982-1c1b0e205603?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDF8fGdlbnRsZW1hbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60"),
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "home",
                style: GoogleFonts.nunito(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "settings",
                style: GoogleFonts.nunito(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                "about",
                style: GoogleFonts.nunito(color: Colors.black),
              ),
            ),
            ListTile(
              
              leading: Icon(Icons.help),
              title: Text(
                "help",
                style: GoogleFonts.nunito(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
