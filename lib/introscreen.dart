import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:luminarsample1/splash3.dart';
import 'package:luminarsample1/statefullogin.dart';

void main() {
  runApp(MaterialApp(
    home: Introscreen(),
  ));
}

class Introscreen extends StatelessWidget {
  const Introscreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      imageFlex: 4,
      titleTextStyle: GoogleFonts.nunito(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Colors.green[900]),
      bodyTextStyle:
          GoogleFonts.nunitoSans(fontSize: 20, fontWeight: FontWeight.bold),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      // imagePadding: EdgeInsets.all(30),
    );
    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: pageDecoration,
          title: 'First Page',
          body: 'Introduction screen shows the details of app and demo page',
          image: Introimage(
              'https://images.unsplash.com/photo-1623656462151-5e62492f8feb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGludHJvZHVjdGlvbiUyMGltYWdlfGVufDB8MXwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60'),
        ),
        PageViewModel(
          decoration: pageDecoration,
          title: 'Second Page',
          body: 'Introduction screen shows the details of app and demo page',
          image: Introimage(
              'https://images.unsplash.com/photo-1680520020860-b8c551caa4c6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fGludHJvZHVjdGlvbiUyMGltYWdlfGVufDB8MXwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60'),
        ),
        PageViewModel(
          decoration: pageDecoration,
          title: 'Third Page',
          body: 'Introduction screen shows the details of app and demo page',
          image: Introimage(
              'https://images.unsplash.com/photo-1586517888066-3e2f8d451b7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTJ8fGludHJvZHVjdGlvbiUyMGltYWdlfGVufDB8MXwwfHx8MA%3D%3D&auto=format&fit=crop&w=700&q=60'),
        ),
      ],
      onDone: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SplashScreen())),
      onSkip: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login2())),
      showSkipButton: true,
      skip: Text(
        "skip",
        style: TextStyle(color: Colors.green),
      ),
      next: Icon(
        Icons.arrow_forward,
        color: Colors.green,
      ),
      done: Text("done"),
      dotsDecorator: DotsDecorator(
          size: Size(10, 12),
          color: Colors.grey,
          activeSize: Size(20, 12),
          activeColor: Colors.green,
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }

  Widget Introimage(String image) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
      ),
    );
  }
}
