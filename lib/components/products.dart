import 'dart:convert';

import 'package:bdexclusive/helper/constant.dart';
import 'package:bdexclusive/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [];

  void getAllProduct() async {
    try {
      final res = await get(Uri.parse(getAllProductApi));
      final jsonData = jsonDecode(res.body) as List;

      setState(() {
        product_list = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProduct();
  }

  // var product = [
  //   {
  //     "id":1,
  //     "image":"assets/products/j1.jpg",
  //     "name":"Blazer",
  //     "price":12500,
  //     "remarks":"Export Quality"
  //   },
  //   {
  //     "id":2,
  //     "image":"assets/products/w1.jpg",
  //     "name":"Female",
  //     "price":12500,
  //     "remarks":"Export Quality"
  //   },
  //   {
  //     "id":3,
  //     "image":"assets/products/e1.jpg",
  //     "name":"Electronics",
  //     "price":12500,
  //     "remarks":"Export Quality"
  //   },
  //   {
  //     "id":4,
  //     "image":"assets/products/j2.jpg",
  //     "name":"Blazer",
  //     "price":12500,
  //     "remarks":"Export Quality"
  //   },
  //   {
  //     "id":5,
  //     "image":"assets/products/w2.jpg",
  //     "name":"Blazer",
  //     "price":12500,
  //     "remarks":"Export Quality"
  //   },
  //   {
  //     "id":6,
  //     "image":"assets/products/e2.jpg",
  //     "name":"Blazer",
  //     "price":12500,
  //     "remarks":"Export Quality"
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 6,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Single_prod(
              prod_name: product_list[index]['productName'],
              prod_img: product_list[index]['imageUri'],
              prod_price: product_list[index]['price'],
              prod_remarks: product_list[index]['remarks'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_img;
  final prod_price;
  final prod_remarks;

  Single_prod({
    this.prod_name,
    this.prod_img,
    this.prod_price,
    this.prod_remarks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text('bdExclusive'),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => productDetails(
                        product_details_name: prod_name,
                        product_details_image: prod_img,
                        product_details_price: prod_price,
                        product_details_remarks: prod_remarks,
                      ))),
              child: GridTile(

                child: Image.network(
                  prod_img,
                  fit: BoxFit.cover,
                ),

                footer: Container(
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "$prod_name",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                      )),
                      Text(
                        "BDT $prod_price TK",
                        style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),


            ),
          )),
    );
  }
}
