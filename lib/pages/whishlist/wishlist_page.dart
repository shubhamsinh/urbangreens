import 'package:flutter/material.dart';
import 'package:urbangreens/pages/cart/cart_page.dart';
import 'package:urbangreens/pages/home/main_footer.dart';
import 'package:urbangreens/pages/home/main_page.dart';
import 'package:urbangreens/pages/product/product.dart';

class wishlistPage extends StatefulWidget {
  const wishlistPage({Key? key}) : super(key: key);

  @override
  State<wishlistPage> createState() => _wishlistPageState();
}

class _wishlistPageState extends State<wishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //start app bar
          Container(
            color: Colors.white,
            height: 55,
            margin: EdgeInsets.only(top: 32),
            // padding: EdgeInsets.only(left: 15, right: 15, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "My Wishlist",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
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
          //end app bar

          //body
          // Text("Shop by Category"),
          Expanded(
            child: SingleChildScrollView(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                          ),
                          margin:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          //color: Colors.white,
                          height: 130,
                          // width: 10,
                          child: Row(
                            children: [
                              Container(
                                // height: 110,
                                width: 125,

                                // decoration: BoxDecoration(border),
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  "images/pro3.jpg",
                                  fit: BoxFit.cover,
                                  // height: 220,
                                  // width: 110,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Indoor Plants",
                                    style: TextStyle(
                                      fontSize: 20,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "₹749",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  OutlinedButton(
                                      onPressed: () {},
                                      child: Text("ADD TO CART"))
                                ],
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 6,
                                        right: 3,
                                      ),
                                      child: Icon(
                                        Icons.cancel_outlined,
                                        size: 24,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductPage()),
                          );
                        },
                      );
                    })),
          ),
          //start footer
          mainFooter(),
          //end footer
        ],
      ),
    );
  }
}
