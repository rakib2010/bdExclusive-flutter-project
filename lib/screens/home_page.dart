import 'package:bdexclusive/components/horizontal_listview.dart';
import 'package:bdexclusive/components/recent_product.dart';
import 'package:bdexclusive/screens/cart_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';



import 'login_page.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BdExclusive"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CartPage()));

              // do something
            },
          ),
        ],
      ),


      // Apps Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text(
                'BdExclusive',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: (){

              },

            ),

            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text('My Cart'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartPage()));

              },

            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){

              },

            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage()));
              },

            ),
          ],
        ),
      ),




      // Body
      body: ListView(
        children: <Widget>[
          SizedBox(
              height: 200.0,
              child: Carousel(
                boxFit: BoxFit.cover,
                images: [
                  AssetImage('assets/images/c1.jpg'),
                  AssetImage('assets/images/c2.jpg'),
                  AssetImage('assets/images/c3.jpg'),
                  AssetImage('assets/images/c4.jpg'),
                  AssetImage('assets/images/c5.jpg'),
                ],
                autoplay: true,
                dotSize: 6.0,
                indicatorBgPadding: 4.0,
                dotColor: Colors.indigo,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(microseconds: 2000),
              )),

          Padding(
            padding: EdgeInsets.all(9.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 18.0),
            ),
          ),



          //categories view
          HorizontalList(),



          //Recent products
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recent Products',style: TextStyle(fontSize: 18.0),),
                Spacer(),
                InkWell(
                  child:
                  Text('Show All', style: TextStyle(fontSize: 18.0),),
                  onTap: (){
                    Navigator.pushNamed(context, "/allproducts");
                  },

                )

              ],
            ),
          ),



          //product Grid view
          Container(
            height: 320.0,
            child: Products(),
          ),



        ],
      ),















      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.apps),
      //       label: 'Apps',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.attach_email),
      //       label: 'Email',
      //     ),
      //   ],
      // ),


      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.indigo,
        items: <Widget>[
          Icon(Icons.add, size: 20),
          Icon(Icons.home, size: 20),
          Icon(Icons.apps, size: 20),
        ],
        color: Colors.white,
        height: 45.0,
        buttonBackgroundColor: Colors.white60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {

          //Handle button tap
        },
      ),









    );
  }
}
