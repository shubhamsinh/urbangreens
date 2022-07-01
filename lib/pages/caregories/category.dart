import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:urbangreens/pages/cart/cart_page.dart';
import 'package:urbangreens/pages/home/main_footer.dart';
import 'package:urbangreens/pages/home/main_page.dart';
import 'package:urbangreens/pages/product/product.dart';

import 'categoryclass.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  Future getCategory() async {
    var response = await http.get(
        Uri.https('https://urbangreens.000webhostapp.com', 'categoryapi.php'));
    var jsonData = jsonDecode(response.body);
    List<Category> lstcat = [];
    for (var cntr in jsonData) {
      Category category =
          Category(cntr["catId"], cntr["catName"], cntr["catImg"]);
      lstcat.add(category);
      lstcat.length;
    }
  }

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
                      "All Categories",
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
            child: Container(
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 10, right: 10, bottom: 5, top: 5),
                        color: Colors.grey[200],
                        height: 100,
                        // width: 10,
                        child: Row(
                          children: [
                            Container(
                              // height: 110,
                              width: 140,
                              // decoration: BoxDecoration(border),
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "images/slide2.jpg",
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
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "View Collection",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 130,
                            ),
                            Container(
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                size: 30,
                              ),
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
                  },
                ),
                // child: FutureBuilder(
                //   future: getCategory(),
                //   builder: (context, snapshot) {
                //     if (snapshot.data == null) {
                //       return Container(
                //         child: Center(
                //           child: Text("Loading....."),
                //         ),
                //       );
                //     } else
                //       // ignore: curly_braces_in_flow_control_structures
                //       return ListView.builder(
                //           itemCount: 2,
                //           itemBuilder: (context, index) {
                //             return ListTile(
                //               title: Text(snapshot.data[index].catName),
                //             );
                //           });
                //   },
                // ),
              ),
            ),
          ),
          //start footer
          mainFooter(),
          //end footer
        ],
      ),
    );
  }
}
