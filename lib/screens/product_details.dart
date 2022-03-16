import 'dart:convert';

import 'package:bdexclusive/helper/http_helper.dart';
import 'package:bdexclusive/model/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_image;
  final product_details_price;
  final product_details_remarks;

  ProductDetails(
      {this.product_details_name,
      this.product_details_image,
      this.product_details_price,
      this.product_details_remarks});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool loaded = false;
  ProductModel productModel = ProductModel(
      id: 0,
      productName: "",
      quantity: 0,
      price: 0,
      remarks: "",
      imageUri: "",
      imageName: "",
      categoryId: 0);




  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;

    print(id);

    if(!loaded){
      productShowById(id.toString()).then((res){
        loaded = true;
        var data = jsonDecode(res.body);

        setState(() {
          productModel =  ProductModel.fromMap(data);
        });

      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(productModel.productName),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartPage()));
              // do something
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
              height: 400.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.network(productModel.imageUri,
                      fit: BoxFit.cover),
                ),
                footer: Container(
                  color: Colors.white54,
                  child: ListTile(
                    leading: Text(
                      "${productModel.productName}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                            child: Text(
                          " BDT ${productModel.price} TK",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                            child: Text(
                          "${productModel.remarks}",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.indigoAccent,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Order Now"),
                  ),
                )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.deepOrangeAccent,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text("Product Specifications"),
              subtitle: Text(
                  "Whether you’re looking to complete your look for an upcoming event, bask in some warmth on a cooler day or add a staple to your work wardrobe - you’re sure to find the perfect piece from the range of men’s jackets from Review Australia."),
            ),
          )
        ],
      ),
    );
  }
}
