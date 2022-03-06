import 'package:bdexclusive/components/all_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProductPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Online Shopping'),
      ),
      body:
        Container(
          child: ProductsAll(),
        ),



    );
  }
}

