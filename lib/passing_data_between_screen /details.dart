import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luminarsample1/passing_data_between_screen%20/dummydata.dart';

class Detailsproduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context)
        ?.settings
        .arguments; //to collect value from previous route

    final productfromlist = product.firstWhere(
      (element) => element['id'] == productid,
    );
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productfromlist['image1']))),
            ),
            Text(
              productfromlist['name'],
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.pink,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description:-",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Text(
              productfromlist['description'],
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '\$ ${productfromlist['price']}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
                Text(
                  ' ${productfromlist['rating']}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
