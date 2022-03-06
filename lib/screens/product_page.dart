import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginform/components/all_product.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Shopping'),
      ),
      body: Container(
        child: ProductsAll(),

      ),
    );
  }
}

