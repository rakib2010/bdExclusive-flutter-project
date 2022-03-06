import 'dart:convert';

import 'package:bdexclusive/helper/constant.dart';
import 'package:bdexclusive/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class ProductsAll extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<ProductsAll> {
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



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
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
          tag: prod_name,
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
                  footer: Container(
                    height: 50.0,
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "$prod_price TK",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),

                    ),
                  ),
                  child: Image.network(
                    prod_img,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
