import 'package:flutter/material.dart';


class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),

                  ],
                ),
                width: 95,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/allproducts");
                  },
                  child: ListTile(
                    title: Image.asset('assets/categories_icon/male.png'),
                    subtitle: Container(
                      alignment: Alignment.topCenter,
                      child: Text('Male'),
                    ),
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                width: 95,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/allproducts");
                  },
                  child: ListTile(
                    title: Image.asset('assets/categories_icon/woman.png'),
                    subtitle: Container(
                      alignment: Alignment.topCenter,
                      child: Text('Female'),
                    ),
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                width: 95,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/allproducts");
                  },
                  child: ListTile(
                    title: Image.asset('assets/categories_icon/electronics.png'),
                    subtitle: Container(
                      alignment: Alignment.topCenter,
                      child: Text('Electronics'),
                    ),
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                width: 95,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/allproducts");
                  },
                  child: ListTile(
                    title: Image.asset('assets/categories_icon/toy.png'),
                    subtitle: Container(
                      alignment: Alignment.topCenter,
                      child: Text('Toys'),
                    ),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
