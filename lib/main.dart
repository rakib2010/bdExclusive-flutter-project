import 'package:flutter/material.dart';
import 'package:loginform/screens/home_page.dart';
import 'package:loginform/screens/splash_screen.dart';
import 'screens/login_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

