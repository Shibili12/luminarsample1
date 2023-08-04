import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Listview2(),
  ));
}

class Listview2 extends StatelessWidget {
  var name = [
    "football",
    "cricket",
    "tennis",
    "jersey",
    "shorts",
    "boots",
    "cricket ball",
    "socks",
    "cap",
    "gloves",
  ];
  var images = [
    "https://rukminim2.flixcart.com/image/832/832/xif0q/ball/r/j/t/400-country-colour-england-5-22-1-1360eg-football-nivia-original-imaghjk2hgfykugg.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/832/832/k186fm80/bat/9/f/n/1000-1200-short-handle-endorsed-for-light-hard-tennis-ball-with-original-imafkuuyxrrphkbr.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/832/832/l4vnbm80/racquet/6/q/s/g2-4-1-4-inches-strung-vxt-barricade-1-vxt-barricade-f-sr-red-original-imagfzbjvwxtf5ba.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/832/832/xif0q/kids-apparel-combo/h/5/d/2-3-years-brazilyellowbp-blueset-rjm-original-imaghamkzgzpguef.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/832/832/xif0q/kids-short/c/z/v/13-14-years-ji-t2fshort-13-14-fasla-original-imag3d8pzucwza7t-bb.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/832/832/xif0q/shoe/o/n/l/-original-imagrzgbra6cyxzx.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/612/612/kh5607k0/ball/h/u/j/150-25-leather-cricket-ball-2-pannel-maroon-standard-1-cricket-original-imafx8bywdh2bcza.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/612/612/kst9gnk0/sock/a/z/3/free-1-123-captain-original-imag6andtcbzk52s.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/612/612/xif0q/cap/c/y/o/free-b-cap-15-bayema-original-imagzvzhve8xw38y.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/612/612/xif0q/sport-glove/n/r/r/left-right-xl-air-strike-gg-695xlbg-150-10-goalkeeping-gloves-original-imagnm2jtbqq7bgf.jpeg?q=70",
  ];
  var price = [
    "450",
    "250",
    "300",
    "400",
    "100",
    "99",
    "150",
    "249",
    "350",
    "234",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          children: [
            Text(
              "NJR SPORTS",
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "mmade kada...",
              style: GoogleFonts.satisfy(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.person_outline,
            color: Colors.green[900],
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.settings,
            color: Colors.green[900],
          ),
          PopupMenuButton(
              color: Colors.green[900],
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Text("your profile")),
                  PopupMenuItem(child: Text("favorites")),
                  PopupMenuItem(child: Text("logout")),
                ];
              }),
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: List.generate(
          10,
          (index) => Card(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(images[index]),
              ),
              title: Text(
                name[index],
                style: GoogleFonts.robotoSerif(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("\$ ${price[index]}"),
              trailing: Wrap(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
