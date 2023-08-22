import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luminarsample1/widgetrefactoring/mywidget.dart';

void main() {
  runApp(MaterialApp(
    home: Refrahome(),
  ));
}

class Refrahome extends StatelessWidget {
  Refrahome();
  var images = [
    "https://images.unsplash.com/photo-1533910534207-90f31029a78e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZG9udXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=700&q=60",
    "https://images.unsplash.com/photo-1541167760496-1628856ab772?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y29mZmVlfGVufDB8fDB8fHww&auto=format&fit=crop&w=700&q=60",
    "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww&auto=format&fit=crop&w=700&q=60",
    "https://images.unsplash.com/photo-1642783944285-b33b18ef6c3b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hhd2FybWF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=700&q=60",
    "https://media.istockphoto.com/id/1410486879/photo/falooda.jpg?s=1024x1024&w=is&k=20&c=iXxPJjeEvz--s6Hdn7mAKrucVtfkPliUFr6jk60C-QE=",
  ];
  var names = ["Donut", "Coffee", "Burger", "shawarma", "falooda"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "coffeehouse",
          style: GoogleFonts.openSans(
              color: Colors.pink, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        itemCount: 5,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return MyWidget(
            name: names[index],
            image: images[index],
          );
        },
      ),
    );
  }
}
