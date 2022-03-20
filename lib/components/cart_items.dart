
import 'dart:convert';
import 'dart:ffi';

import 'package:bdexclusive/helper/constant.dart';
import 'package:bdexclusive/model/CartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  List<CartModel> cartItems = [];


  void getCart() async {
    try {
      final res = await get(Uri.parse(getCartItemsApi));
      final jsonData = jsonDecode(res.body) as List;
      cartItems =  jsonData.map((e) => CartModel.fromMap(e)).toList();
      setState(() {
        // product_list = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCart();

  }








  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index){
        return Text(cartItems[index].productName);
      }
    );
  }
}
