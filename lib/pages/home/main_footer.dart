import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbangreens/pages/caregories/category.dart';
import 'package:urbangreens/pages/product/product.dart';
import 'package:urbangreens/pages/profile/profile.dart';
import 'package:urbangreens/pages/profile/profile_guest.dart';
import 'package:urbangreens/pages/signup-login/signin.dart';
import 'package:urbangreens/pages/whishlist/wishlist_page.dart';

import 'main_page.dart';

String finalemail = "";

class mainFooter extends StatefulWidget {
  const mainFooter({Key? key}) : super(key: key);

  @override
  State<mainFooter> createState() => _mainFooterState();
}

class _mainFooterState extends State<mainFooter> {
  Future getdata() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtemail = preferences.getString('email');
    setState(() {
      if (obtemail == null) {
        finalemail = "";
      } else {
        finalemail = obtemail;
      }
    });
    print(finalemail);
  }

  @override
  Color iconclickcolor = Colors.black;
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // color: Colors.white,
      // margin: EdgeInsets.only(bottom: 70),
      padding: EdgeInsets.only(
          // left: 10,
          // right: 10,
          // bottom: 2,
          ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            child: Container(
              width: 105,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    size: 20,
                    color: iconclickcolor,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              iconclickcolor = Colors.blue;
              setState(() {});
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },
          ),
          InkWell(
            child: Container(
              width: 105,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const category()),
              );
            },
          ),
          InkWell(
            child: Container(
              width: 105,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Wishlist",
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const wishlistPage()),
              );
            },
          ),
          InkWell(
            child: Container(
              width: 105,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 20,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
            onTap: () {
              getdata().whenComplete(() async {
                finalemail == ""
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const profilePageGuest()),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const profile()),
                      );
              });
              // final myString = preferences.getString('my_string_key');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const profilePageGuest()),
              // );
            },
          ),
        ],
      ),
    );
  }
}
