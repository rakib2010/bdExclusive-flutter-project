import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MyListView(
            img_location: 'assets/categories_icon/male.png',
            img_caption: 'Male',
          ),
          MyListView(
            img_location: 'assets/categories_icon/woman.png',
            img_caption: 'Female',
          ),
          MyListView(
            img_location: 'assets/categories_icon/electronics.png',
            img_caption: 'Electronics',
          ),
          MyListView(
            img_location: 'assets/categories_icon/toy.png',
            img_caption: 'Toys',
          ),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget {


  final String img_location;
  final String img_caption;
  MyListView({required this.img_location, required this.img_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 90.0,
        child: InkWell(
          onTap: (){},
          child: ListTile(
            title: Image.asset(img_location),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(img_caption),
            ),

          ),
        ),
      ),
    );
  }
}

