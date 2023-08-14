import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: Carosalsliders(),
  ));
}

class Carosalsliders extends StatelessWidget {
  const Carosalsliders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/singer1.jpg"))),
          ),
          Container(
            height: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/mini2.jpg"))),
          ),
          Container(
            height: 500,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/hooliesplash.jpg"))),
          ),
        ],
        initialPage: 0,
        enableAutoSlider: true,
        viewportFraction: 1,
        autoSliderTransitionCurve: Curves.linear,
      ),
    );
  }
}
