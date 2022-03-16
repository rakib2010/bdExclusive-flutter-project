import 'dart:convert';
import 'package:bdexclusive/constants/routes.dart';
import 'package:bdexclusive/helper/constant.dart';
import 'package:bdexclusive/model/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class ProductsAll extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<ProductsAll> {
  List<ProductModel> product_list = [];

  void getAllProduct() async {
    try {
      final res = await get(Uri.parse(getAllProductApi));
      final jsonData = jsonDecode(res.body) as List;
      product_list =  jsonData.map((e) => ProductModel.fromMap(e)).toList();

      setState(() {
        // product_list = jsonData;
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
