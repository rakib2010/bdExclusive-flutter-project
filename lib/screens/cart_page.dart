
import 'package:bdexclusive/components/cart_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
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

      body: CartItems(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(child: ListTile(
              title: Text('Total:'),
              subtitle: Text('12800 TK'),
            )),
            Expanded(
                child: MaterialButton(onPressed: (){},
                  child: Text('Check out', style: TextStyle(color: Colors.white),),
                  color: Colors.indigo,

                )
            )
          ],
        ),
      ),






    );
  }
}
