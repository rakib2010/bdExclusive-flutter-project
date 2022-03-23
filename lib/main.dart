import 'package:bdexclusive/constants/routes.dart';
import 'package:bdexclusive/screens/electronics_page.dart';
import 'package:bdexclusive/screens/femaleFashion_page.dart';
import 'package:bdexclusive/screens/maleFashion_page.dart';
import 'package:bdexclusive/screens/product_details.dart';
import 'package:bdexclusive/screens/product_page.dart';
import 'package:bdexclusive/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: Routes.root,
      routes: {
        Routes.root: (context) => SplashScreen(),
        Routes.allproducts: (context) => AllProductPage(),
        Routes.productDetails: (context) => ProductDetails(),
        Routes.maleFashion: (context) => MaleFashionPage(),
        Routes.femaleFashion: (context) => FemaleFashionPage(),
        Routes.electronics: (context) => ElectronicsPage(),
      },
    );
  }
}
