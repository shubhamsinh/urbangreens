import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbangreens/pages/cart/cart_page.dart';
import 'package:urbangreens/pages/home/main_footer.dart';
import 'package:urbangreens/pages/home/main_page.dart';
import 'package:urbangreens/pages/profile/profile_guest.dart';
import 'package:urbangreens/pages/signup-login/signin.dart';

String finalemail = "";

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Future getdata() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtemail = preferences.getString('email');
    setState(() {
      finalemail = obtemail!;
    });
    print(finalemail);
  }

  Future removedata() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    setState(() {});
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MainPage();
      },
    ));
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
                      "My Account",
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
          Container(
            height: 250,
            width: 440,
            color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/profile.png"),
                  radius: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Shubhamsinh Rahevar",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "+91 8128734037",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  finalemail,
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    getdata();
                  },
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          removedata();
                        },
                        child: Text("Logout"))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
