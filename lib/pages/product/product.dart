import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbangreens/pages/cart/cart_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //nav bar
          Container(
            color: Colors.white,
            height: 60,
            margin: EdgeInsets.only(top: 32),
            // padding: EdgeInsets.only(left: 15, right: 15, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 58,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 28,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const cartPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          //product title
          Expanded(
            child: Container(
              // height: 650,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    //image
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/slide3.jpg"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 240,
                    right: 20,
                    //icons over product image
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_outlined),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            //size(40)/2
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share_outlined,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 350,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Money plant marble prince Money plant marble prince Money plant marble prince",
                            style: TextStyle(fontSize: 21, color: Colors.black),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                "₹749",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "₹699",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //description

          //bottom nav bar
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 50,
                  //color: Colors.white,
                  child: Center(
                    child: Text(
                      "ADD TO CART",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.lightGreen,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(2, 0), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(-2, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 50,
                  // color: Colors.green,
                  child: Center(
                    child: Text(
                      "BUY NOW",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
