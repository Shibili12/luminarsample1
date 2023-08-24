import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Simpleanimation(),
  ));
}

class Simpleanimation extends StatefulWidget {
  const Simpleanimation({super.key});

  @override
  State<Simpleanimation> createState() => _SimpleanimationState();
}

class _SimpleanimationState extends State<Simpleanimation>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationcontroller;
  @override
  void initState() {
    animationcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation =
        Tween<double>(begin: 12.0, end: 50.0).animate(animationcontroller!)
          ..addListener(() {
            setState(() {
              animationcontroller!.forward();
            });
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: Text(
                "Hola Mundo",
                style: TextStyle(fontSize: animation?.value),
              ),
            ),
            ElevatedButton(
                onPressed: () => zoomIn(), child: Text("Increase text size")),
          ],
        ),
      ),
    );
  }

  zoomIn() {
    animationcontroller!.forward();
  }
}
