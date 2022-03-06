import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class productDetails extends StatefulWidget {


  final product_details_name;
  final product_details_image;
  final product_details_price;
  final product_details_remarks;


  productDetails({
    this.product_details_name,
    this.product_details_image,
    this.product_details_price,
    this.product_details_remarks
});


  @override
  _productDetailsState createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.product_details_name),

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
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),


      body: ListView(
        children: [
          Container(
            height:400.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(
                  widget.product_details_image,
                      fit: BoxFit.cover
                ),
              ),

              footer: Container(
                color: Colors.white54,
                child: ListTile(
                  leading: Text("${widget.product_details_name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),

                  title: Row(
                    children: [
                      Expanded(
                          child: Text(" BDT ${widget.product_details_price} TK",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                      ),
                      Expanded(
                          child: Text("${widget.product_details_remarks}",
                            style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                          )
                      ),
                    ],
                  ),



                ),

              ),

            )
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: MaterialButton(
                        onPressed: () {  },
                        color: Colors.indigoAccent,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: Text("Order Now"),

                      ),
                    )

                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart), color: Colors.deepOrangeAccent,),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite), color: Colors.red,),
              ],

            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                title: Text("Product Specifications"),
                subtitle: Text("Whether you’re looking to complete your look for an upcoming event, bask in some warmth on a cooler day or add a staple to your work wardrobe - you’re sure to find the perfect piece from the range of men’s jackets from Review Australia."),
            ),
          )
        ],
      ),
    );
  }
}
