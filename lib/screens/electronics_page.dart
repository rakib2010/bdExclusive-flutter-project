


import 'dart:convert';

import 'package:bdexclusive/constants/routes.dart';
import 'package:bdexclusive/helper/http_helper.dart';
import 'package:bdexclusive/model/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class ElectronicsPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Online Shopping'),
      ),
      body:
      Container(
        child: Electronics(),
      ),



    );
  }
}







class Electronics extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Electronics> {
  List<ProductModel> product_list = [];

  void getProductById() {
    findByCategoryIdThree().then((res) {
      var data = jsonDecode(res.body) as List<dynamic>;
      product_list =  data.map((e) => ProductModel.fromMap(e)).toList();
      setState(() {


      });
    });
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductById();
    print(product_list);

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
              id: product_list[index].id,
              prod_name: product_list[index].productName,
              prod_img: product_list[index].imageUri,
              prod_price: product_list[index].price,
              prod_remarks: product_list[index].remarks,
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final id;
  final prod_name;
  final prod_img;
  final prod_price;
  final prod_remarks;

  Single_prod({
    this.id,
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
              onTap: () {

                Navigator.pushNamed(context, Routes.productDetails,arguments: id);
              } ,
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
          )
      ),

    );
  }
}
