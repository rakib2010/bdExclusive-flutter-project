

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String items ='';
  String totalPrice ='';



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalData();


  }



  getLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      items = prefs.getString('totalItem')!;
      totalPrice = prefs.getString('price')!;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Center(
      child: Container(
      width: 300,
      height: 200,
      padding: new EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white54,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
              child: const ListTile(

                title: Text(
                    'Name: Rakib Hasan',
                    style: TextStyle(fontSize: 20.0)
                ),
                subtitle: Text(
                    'Total Item : 6'+'\n'+
                        'Total Price: 24000 Tk',
                    style: TextStyle(fontSize: 18.0)
                ),




              ),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: const Text('View more'),
                  onPressed: () {/* ... */},
                ),

              ],
            ),
          ],
        ),
      ),
    )
    ),

    );
  }


}




