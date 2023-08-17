import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luminarsample1/passing_data_between_screen%20/details.dart';
import 'package:luminarsample1/passing_data_between_screen%20/dummydata.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
    routes: {
      'details': (context) => Detailsproduct(),
    },
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Shop here",
          style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.bold, color: Colors.pink, fontSize: 50),
        ),
      ),
      body: ListView(
        children: product
            .map((productonebyone) => Card(
                  color: Colors.pink[50],
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.2),
                        borderRadius: BorderRadius.circular(6)),
                    height: 100,
                    child: Center(
                      child: ListTile(
                        onTap: () =>
                            gotonextpage(context, productonebyone['id']),
                        leading: Container(
                          height: 90,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(productonebyone['image1']))),
                        ),
                        title: Text(
                          productonebyone['name'],
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text('\$ ${productonebyone['price']}'),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  void gotonextpage(BuildContext context, productid) {
    Navigator.pushNamed(context, 'details', arguments: productid);
  }
}
