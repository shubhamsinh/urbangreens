import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbangreens/pages/cart/cart_page.dart';
import 'package:urbangreens/pages/home/main_footer.dart';
import 'package:urbangreens/pages/home/page_body.dart';
import 'package:urbangreens/pages/product/product.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // color: Colors.green[400],
            height: 55,
            margin: EdgeInsets.only(top: 32),
            padding: EdgeInsets.only(left: 22, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "UrbanGreens",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 35),
                //   child: Text(
                //     "UrbanGreens",
                //     style: TextStyle(fontSize: 22),
                //   ),
                // ),
                // Image.asset(
                //   'images/logo.png',
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 40,
                        child: Icon(
                          Icons.search,
                          size: 28,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductPage()),
                        );
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          size: 28,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const cartPage()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: PageBody(),
          )),
          mainFooter(),
        ],
      ),
    );
  }
}
