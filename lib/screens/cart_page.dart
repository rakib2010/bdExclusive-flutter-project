import 'dart:convert';
import 'package:bdexclusive/helper/constant.dart';
import 'package:bdexclusive/helper/http_helper.dart';
import 'package:bdexclusive/model/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  _AddCartState createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  int _currentIndex = 0;
  List<CartModel> cartItems = [];

  @override
  void initState() {
    super.initState();
    getCart();
  }

  void getCart() async {
    try {
      final res = await get(Uri.parse(getCartItemsApi));
      final jsonData = jsonDecode(res.body) as List;
      cartItems = jsonData.map((e) => CartModel.fromMap(e)).toList();
      calculate();

      setState(() {
        // product_list = jsonData;
      });
    } catch (err) {
      print(err);
    }
  }

  double Total = 0.0;
  void calculate() {
    Total = 0.0;
    for (var index = 0; index < cartItems.length; index++) {
      Total += cartItems[index].price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Favorite Cart"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 450.0,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext, index) {
                      return Card(
                        color: Colors.white70,
                        elevation: 2.0,
                        child: ListTile(
                          leading: Image.network(cartItems[index].imageUri),
                          title: Text(
                            cartItems[index].productName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            cartItems[index].price.toString() + ' TK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                              size: 40,
                            ),
                            onPressed: () async {
                              await deleteCartById(cartItems[index].id);
                              getCart();
                              print(cartItems[index].id);

                              Fluttertoast.showToast(
                                  msg:
                                      "${cartItems[index].productName} is removed!",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 3,
                                  backgroundColor: Colors.white60,
                                  textColor: Colors.green,
                                  fontSize: 20.0);
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: cartItems.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white70,
        child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text(
                'Total:',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "BDT " + Total.toString() + " TK",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
                child: MaterialButton(
              onPressed: () async {
                double p = Total;
                int i = cartItems.length;

                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setDouble("price", p);
                prefs.setInt("totalItem", i);

                var snackBar = SnackBar(content: Text('Your Order is Placed successfully'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

              },
              child: Text(
                'Chekcout',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            ))
          ],
        ),
      ),
    );
  }
}
