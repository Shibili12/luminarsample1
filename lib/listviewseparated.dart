import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Listviewseparated(),
  ));
}

class Listviewseparated extends StatelessWidget {
  const Listviewseparated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
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
          );
        },
        separatorBuilder: (context, index) {
          if (index % 3 == 0) {
            return Divider(
              thickness: 3,
              color: Colors.red,
            );
          } else {
            return SizedBox();
          }
        },
        itemCount: 15,
      ),
    );
  }
}
