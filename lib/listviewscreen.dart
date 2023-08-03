import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Listviewscreen(),
  ));
}

class Listviewscreen extends StatelessWidget {
  const Listviewscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Text(
            "heloo guyzz",
            style: GoogleFonts.lilitaOne(
              fontSize: 60,
              color: Colors.blue[900],
            ),
          ),
        ),
        Center(
          child: Text(
            "most popular sports items is here",
            style: GoogleFonts.satisfy(
              fontSize: 20,
              color: Colors.green[900],
            ),
          ),
        ),
        Card(
          // color: Colors.yellow,
          elevation: 10,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://rukminim2.flixcart.com/image/832/832/xif0q/ball/r/j/t/400-country-colour-england-5-22-1-1360eg-football-nivia-original-imaghjk2hgfykugg.jpeg?q=70"),
            ),
            title: Text(
              "Nivea football",
              style: GoogleFonts.robotoSerif(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Price:299"),
            trailing: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ),
        Card(
          // color: Colors.yellow,
          elevation: 10,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://rukminim2.flixcart.com/image/832/832/k186fm80/bat/9/f/n/1000-1200-short-handle-endorsed-for-light-hard-tennis-ball-with-original-imafkuuyxrrphkbr.jpeg?q=70"),
            ),
            title: Text(
              "Cricket",
              style: GoogleFonts.robotoSerif(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Price:1999"),
            trailing: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ),
        Card(
          // color: Colors.yellow,
          elevation: 10,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                "https://rukminim2.flixcart.com/image/832/832/l4vnbm80/racquet/6/q/s/g2-4-1-4-inches-strung-vxt-barricade-1-vxt-barricade-f-sr-red-original-imagfzbjvwxtf5ba.jpeg?q=70",
              ),
            ),
            title: Text(
              "tennis",
              style: GoogleFonts.robotoSerif(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Price:478"),
            trailing: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ),
        // Card(
        //   // color: Colors.yellow,
        //   elevation: 10,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       radius: 30,
        //       backgroundImage: NetworkImage(
        //         "https://media.licdn.com/dms/image/D5635AQE3xNofN0uO3g/profile-framedphoto-shrink_800_800/0/1686713037382?e=1691668800&v=beta&t=PgmQoyzzqtPxL5H8yYJsloyI_jxbOLos1_GnzeJvKus",
        //       ),
        //     ),
        //     title: Text(
        //       "Expensive vazha",
        //       style: GoogleFonts.robotoSerif(fontWeight: FontWeight.bold),
        //     ),
        //     subtitle: Text("Price:free onam offer"),
        //     trailing: Icon(
        //       Icons.shopping_cart,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
      ],
    ));
  }
}
