import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: homePage(),
      duration: 4000,
      imageSize: 130,
      imageSrc: "assets/splash_screen/splash_logo.jpg",
      text: "BdExclusive",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );

    return Scaffold(
      body: example1,
    );
  }
}